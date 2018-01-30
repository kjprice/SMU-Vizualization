void drawSlope() {
  float startingX = width * 1/8;
  float startingY = height * 2/3;
  
  float endingX = width * 9/10;
  float endingY = width * 1/4;
  
  line(startingX, startingY, endingX, endingY);
}