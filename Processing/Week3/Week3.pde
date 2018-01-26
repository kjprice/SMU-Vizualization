// Based on http://www.woodthatworks.com/kinetic-sculptures/nautilus.html

float centerKnobRadius;
float smallFinCenterRadius;
int absoluteCenterX;
int absoluteCenterY;

void setup() {
  size(200, 200);
  noStroke();
  noLoop();
  absoluteCenterX = width / 2;
  absoluteCenterY = height / 2;
  // absoluteCenterX = 0;
  // absoluteCenterY = 0;
  
  centerKnobRadius = width *.05;
  smallFinCenterRadius = width *.10;
}

void draw() {
  background(30, 30, 90);
  drawAxis(1);
  // drawAxis(-1);
  drawCenterKnob();
}

void drawAxis(int direction) {
  drawSmallFin(direction); // 6 times
  drawLargeFin(direction);
  drawSmallFinCenter();
}

void drawSmallFinCenter() {
  fill(200, 200, 200);
  ellipse(absoluteCenterX, absoluteCenterY, smallFinCenterRadius, smallFinCenterRadius);
}

void drawLargeFin(int direction) {
  // draw two curveVertex groups by using circles
  new LargeFin(direction);
}

void drawCenterKnob() {
  fill(255);
  ellipse(absoluteCenterX, absoluteCenterY, centerKnobRadius, centerKnobRadius);
}