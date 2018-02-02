float newVelocityWithGravity(float velocity) {
  forceOfGravity = 9.8 * (characterHeight / 9) / frameRate; // 9.8 meters/second^2

  return velocity + forceOfGravity;
}