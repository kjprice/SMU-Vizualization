// Based on http://www.woodthatworks.com/kinetic-sculptures/nautilus.html

float centerKnobRadius;
float smallFinCenterRadius;

void setup() {
  size(200, 200);
  noStroke();
  noLoop();
  
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
  ellipse(width/2, height/2, smallFinCenterRadius, smallFinCenterRadius);
}

void drawLargeFin(int direction) {
  // draw two curveVertex groups by using circles
  new LargeFin(direction);
}

void drawCenterKnob() {
  fill(255);
  ellipse(width/2, height/2, centerKnobRadius, centerKnobRadius);
}