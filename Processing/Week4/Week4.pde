int DELAY_BETWEEN_BARRELS =  1 ; // 2 seconds

float barrelStartingPositionX;
float barrelStartingPositionY;
float barrelRadius ; 
float x, y;
float spdX, spdY,theta;

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
  spdY = 1.5;
  theta = PI/2;
  
  
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

  calculateCharacterPosition();
  drawCharacter();
  
  drawSlope();
  

  drawBarrels();
  x -= spdX;
  collide();
  
  drawGoal();
  
}


void collide() {
  if (y < slopePositionStartY-barrelRadius/2) {
    y += spdY;
    x += spdX;
  }
  else if (y == slopePositionStartY-barrelRadius/2) { 
    x -= spdX;
  } 
} 