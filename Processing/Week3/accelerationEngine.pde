
int numberFramesSwitchDirection = 60 * 10; // 10 seconds
int startingFrameToCountSwich[] =  new int[] { 0, numberFramesSwitchDirection / 2 };
float accelerationWeight[] = new float[] {0, 0};
int accelerationDirections[] = new int[]{ -1, 1 };
float accelerationRangeWeight = PI / 2000;
float accelerationRange[] = new float[] { -accelerationRangeWeight, accelerationRangeWeight };
float accelerationBias = accelerationRangeWeight;
float maximumSpeed = PI/120;
float maximumAcceleration = maximumSpeed / 60;

// When acceleration is too much, queue it up to be used in a later frame
float accelerationQueue[] = new float[] { 0, 0 };

float maximumQueue = maximumAcceleration * 2;

/* Too avoid jumps of acceleration during a single frame, spread the acceleration into multiple frames */
float getCappedAcceleration(float acceleration, int index) {
  int multiplier = (acceleration < 0 ? -1 : 1);
  float newAcceleration = acceleration;
  if (acceleration < -maximumAcceleration) {
    newAcceleration = -maximumAcceleration;
    float accelerationDifference = acceleration + maximumAcceleration;
    accelerationQueue[index] += accelerationDifference;
  } else if (acceleration > maximumAcceleration) {
    newAcceleration = maximumAcceleration;
    float accelerationDifference = acceleration - maximumAcceleration;
    accelerationQueue[index] += accelerationDifference;
  } else { // this is not such an epic acceleration, let's see if there's anything in the queuue to use
    if (abs(accelerationQueue[index] + acceleration) > maximumAcceleration) {
      float accelerationDifference = maximumAcceleration - abs(acceleration);
      newAcceleration = multiplier * maximumAcceleration;

      if (accelerationQueue[index] < 0) {
        accelerationQueue[index] += accelerationDifference;
      } else {
        accelerationQueue[index] -= accelerationDifference;
      }
    }
    else {
      // empty accelerationQueue[index]
      newAcceleration += accelerationQueue[index];
      accelerationQueue[index] = 0;
    }
  }

  if (accelerationQueue[index] < -maximumQueue) {
    accelerationQueue[index] = -maximumQueue;
  } else if (accelerationQueue[index] > maximumQueue) {
    accelerationQueue[index] = maximumQueue;
  }
  return newAcceleration;
}

void performAcceleration(int index) {
  accelerationWeight[index] = accelerationWeight[index] + (1/numberFramesSwitchDirection * accelerationDirections[index]);
  if ((frameCount + startingFrameToCountSwich[index]) % numberFramesSwitchDirection == 0) {
    accelerationDirections[index] = -accelerationDirections[index]; 
  }
  float biasDirection = accelerationBias * accelerationWeight[index];
  float acceleration = random(accelerationRange[0], accelerationRange[1]) + biasDirection;
  acceleration = getCappedAcceleration(acceleration, index);

  float newSpeed = rotSpd[index] + acceleration;

  if (newSpeed < -maximumSpeed) {
    newSpeed = -maximumSpeed;
  }
  else if (newSpeed > maximumSpeed) {
    newSpeed = maximumSpeed;
  }
  
  rotSpd[index] = newSpeed;
}