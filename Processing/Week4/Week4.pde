int DELAY_BETWEEN_BARRELS = 60 * 2; // 2 seconds

float barrelStartingPositionX;
float barrelStartingPositionY;
float characterHeight;
float characterPositionX;
float characterPositionY;

float slopePositionStartX;
float slopePositionStartY;
float slopePositionEndX;
float slopePositionEndY;

void setup() {
  size(800, 500);
  barrelStartingPositionX = width * 5/8;
  barrelStartingPositionY = width * 1/4;
  
  loadCharacterImages();
  characterHeight = height / 6;
  
  slopePositionStartX = width * 1/8;
  slopePositionStartY = height * 5/8;
  slopePositionEndX = width * 9/10;
  slopePositionEndY = slopePositionStartY;

  characterPositionX = slopePositionStartX;
  characterPositionY = slopePositionStartY - characterHeight;
}

void draw() {
  drawCharacter();
  drawBarrels();
  drawSlope();
}