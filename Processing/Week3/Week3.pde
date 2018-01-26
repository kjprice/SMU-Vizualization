// Based on http://www.woodthatworks.com/kinetic-sculptures/nautilus.html

int centerKnobRadius = 10;
int smallFinCenterRadius = 18;

void setup() {
  size(200, 200);
  noStroke();
  noLoop();
}

void draw() {
  background(30, 30, 90);
  drawAxis(1);
  // drawAxis(-1);
  drawCenterKnob();
}

void drawAxis(int direction) {
  drawSmallFinCenter();
  drawSmallFin(direction); // 6 times
  drawLargeFin(direction);
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