// Based on http://www.woodthatworks.com/kinetic-sculptures/nautilus.html

float centerKnobRadius;
float smallFinCenterRadius;
int absoluteCenterX;
int absoluteCenterY;
int originX;
int originY;

float theta, theta2, rotSpd, rotSpd2;

void setup() {
  size(500, 500, P3D);
  noStroke();
  //noLoop();
  originX = 0;
  originY = 0;
  absoluteCenterX = width / 2;
  absoluteCenterY = height / 2;
  
  centerKnobRadius = width *.05;
  smallFinCenterRadius = width *.10;
  
  rotSpd = PI/180;
  rotSpd2 = -PI/180;
}

void draw() {
  translate(absoluteCenterX, absoluteCenterY);
  background(30, 30, 90);
  //drawAxis(1);
  //drawAxis(-1);
  
  // Clockwise rotation
  pushMatrix();
  rotate(theta);
  drawAxis(1);
  popMatrix();
  
  // Anti Clockwise rotation
  pushMatrix();
  rotate(theta2);
  drawAxis(-1);
  popMatrix();
  
  drawCenterKnob();
  
  theta += rotSpd;
  theta2 += rotSpd2;
}

void drawAxis(int direction) {
  drawLargeFin(direction);
  drawSmallFin(direction); // 6 times
  drawSmallFinCenter();
}

void drawSmallFinCenter() {
  fill(200, 200, 200);
  ellipse(originX, originY, smallFinCenterRadius, smallFinCenterRadius);
}

void drawLargeFin(int direction) {
  // draw two curveVertex groups by using circles
  new LargeFin(direction);
}

void drawCenterKnob() {
  fill(142, 100, 60);
  ellipse(originX, originY, centerKnobRadius, centerKnobRadius);
}