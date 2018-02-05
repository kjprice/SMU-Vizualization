int timer =  0 ; 

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

boolean gameOver = false;
boolean gameOverFail = false;

void setup() {
  size(800, 600);
  
  setupCharacter();

  characterHeight = height / 6;
  
  slopePositionStartX = width * 1/8;
  slopePositionStartY = height * 5/8;
  slopePositionEndX = width * 9/10;
  slopePositionEndY = slopePositionStartY;

  characterPositionX = slopePositionStartX;
  characterPositionY = 0;
  
  barrelStartingPositionX = width * 9/10;
  barrelStartingPositionY = width * 1/4;
  barrelRadius = characterHeight*5/8;
  
  x = barrelStartingPositionX;
  y = barrelStartingPositionY;
  spdX = 6;
  spdY = 3;
  
  setupGameOverText();
  setupGoal();  
}

void draw() {
  background(255);
  
  if (gameOver) {
    gameOverText();
    drawCharacter();
    return;
  }

  if (gameOverFail) {
    gameOverTextFail();
    drawCharacter();
    drawBarrel();
    return;
  }

  calculateCharacterPosition();
  drawCharacter();
  drawSlope();
  drawGoal();
 
  drawBarrel();
  collideBarrelSlope();
  collideBarrelChar();
  
}