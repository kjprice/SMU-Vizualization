float characterHeight;
float barrelStartingPositionX;
float barrelStartingPositionY;
float barrelRadius ; 
float x, y, w;
float spdX, spdY, theta, rotSpd;

float slopePositionStartX;
float slopePositionStartY;
float slopePositionEndX;
float slopePositionEndY;

void setup() {
  size(600, 600);
  characterHeight = height / 6;
  slopePositionStartX = width * 1/8;
  slopePositionStartY = height * 5/8;
  slopePositionEndX = width * 9/10;
  slopePositionEndY = slopePositionStartY;
  
  // initialize global variables
  barrelStartingPositionX = width * 9/10;
  barrelStartingPositionY = width * 1/4;
  
  x = barrelStartingPositionX;
  y = barrelStartingPositionY;
  barrelRadius = characterHeight*5/8;
  spdX = 1;
  spdY = 2.1;
  //rotSpd = PI/180;
  fill(0, 175, 175);
  //noStroke();
} // end setup

void draw() {
  background(255, 127, 0);
  
  line(slopePositionStartX, slopePositionStartY, slopePositionEndX, slopePositionEndY);
  
  pushMatrix();
  ellipse(x, y, barrelRadius, barrelRadius);
  popMatrix();
  
  collide();

} 


void collide() {
  if (y < slopePositionStartY-barrelRadius/2) {
    y += spdY;
  }
  else if (y == slopePositionStartY-barrelRadius/2) { 
    x -= spdX*2;
  } 
} 