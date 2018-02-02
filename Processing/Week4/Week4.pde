int DELAY_BETWEEN_BARRELS =  1 ; // 2 seconds

float barrelStartingPositionX;
float barrelStartingPositionY;
float barrelRadius ; 
float x, y;
float spdX, spdY;

float characterHeight;

float characterPositionX;
float characterPositionY;

float slopePositionStartX;
float slopePositionStartY;
float slopePositionEndX;
float slopePositionEndY;

float characterRunningSpeed;

float forceOfGravity;

void setup() {
  size(800, 800);
  
  setupCharacter();

  characterHeight = height / 6;
  
  slopePositionStartX = width * 1/8;
  slopePositionStartY = height * 5/8;
  slopePositionEndX = width * 9/10;
  slopePositionEndY = slopePositionStartY;

  characterPositionX = slopePositionStartX;
  characterPositionY = slopePositionStartY - characterHeight;
  
  barrelStartingPositionX = width * 9/10;
  barrelStartingPositionY = width * 1/4;
  barrelRadius = characterHeight*5/8;
  
  x = barrelStartingPositionX;
  y = barrelStartingPositionX;
  spdX = 2.1;
  spdY = 1.5;
  
}

void draw() {
  background(255);
  drawCharacter();
  
  drawSlope();
  
  pushMatrix();
  drawBarrels();
  popMatrix();
  
  //x += spdX;
  //y += spdY;
  
  collideBarrel();
  
  
}


void collideBarrel() {
  if (y < slopePositionStartY-barrelRadius/2) {
    y += spdY;
  }
  else if (y == slopePositionStartY-barrelRadius/2) { 
    x -= spdX*2;
  } 
} 