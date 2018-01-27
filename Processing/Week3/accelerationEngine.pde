
int numberFramesSwitchDirection = 200;
float accelerationWeight[] = new float[] {0, 0};
int accelerationDirections[] = new int[]{ -1, 1 };
float accelerationRangeWeight = PI / 3000;
float accelerationRange[] = new float[] { -accelerationRangeWeight, accelerationRangeWeight };
float accelerationBias = accelerationRangeWeight * .5;
float maximumSpeed = PI/120;
float maximumAcceleration = maximumSpeed / 60;

// When acceleration is too much, queue it up to be used in a later frame
float accelerationQueue[] = new float[] { 0, 0 };

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
  return newAcceleration;
}

void performAcceleration(int index) {
  accelerationWeight[index] = accelerationWeight[index] * (1/300 * accelerationDirections[index]); 
  if (frameCount % numberFramesSwitchDirection == 0) {
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