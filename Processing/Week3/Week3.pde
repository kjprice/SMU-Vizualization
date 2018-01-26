// Based on http://www.woodthatworks.com/kinetic-sculptures/nautilus.html

float centerKnobRadius;
float smallFinCenterRadius;
int absoluteCenterX;
int absoluteCenterY;
int originX;
int originY;

void setup() {
  size(200, 200, P3D);
  noStroke();
  noLoop();
  originX = 0;
  originY = 0;
  absoluteCenterX = width / 2;
  absoluteCenterY = height / 2;
  
  centerKnobRadius = width *.05;
  smallFinCenterRadius = width *.10;
}

void draw() {
  translate(absoluteCenterX, absoluteCenterY);
  background(30, 30, 90);
  drawAxis(1);
  drawAxis(-1);
  drawCenterKnob();
}

void drawAxis(int direction) {
  drawSmallFin(direction); // 6 times
  drawLargeFin(direction);
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
  fill(255);
  ellipse(originX, originY, centerKnobRadius, centerKnobRadius);
}