int DELAY_BETWEEN_BARRELS = 60 * 2; // 2 seconds

float barrelStartingPositionX;
float barrelStartingPositionY;

void setup() {
  size(800, 500);
  barrelStartingPositionX = width * 5/8;
  barrelStartingPositionY = width * 1/4;
}

void draw() {
  drawCharacter();
  drawBarrels();
  drawSlope();
}