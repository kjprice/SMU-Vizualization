
ArrayList <barrel> barrels = new ArrayList <barrel> ();

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
  
  //x = barrelStartingPositionX;
  //y = barrelStartingPositionY;
  //spdX = 6;
  //spdY = 3;
  
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
    //drawBarrel();
    return;
  }

  calculateCharacterPosition();
  drawCharacter();
  drawSlope();
  drawGoal();
 

  if (frameCount % 100 == 0) {
    barrels.add(new barrel());
    println(barrels.size());
 //   barrel b = new barrel();
 //   b.collideBarrelSlope();
 //   b.collideBarrelChar();
  }
  
  
 for (int i=barrels.size()-1; i>=0; i--) {
    barrel b = barrels.get(i);
    b.display();
    b.collideBarrelSlope();
    b.collideBarrelChar();
  }
 //drawBarrel();
  //collideBarrelSlope();
  //collideBarrelChar();

  
}