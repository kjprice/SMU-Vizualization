float slopeYPosition() {
  return height * 5/8;
}

void drawSlope() {
  float startingX = width * 1/8;
  float startingY = slopeYPosition();
  
  float endingX = width * 9/10;
  float endingY = slopeYPosition();
  
  line(startingX, startingY, endingX, endingY);
}