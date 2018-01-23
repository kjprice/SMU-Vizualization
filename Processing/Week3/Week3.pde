// Based on http://www.woodthatworks.com/kinetic-sculptures/nautilus.html

void setup() {
}

void draw() {
  drawAxis(1);
  drawAxis(-1);
  drawCenterKnob();
}

void drawAxis(int direction) {
  drawSmallFin(direction); // 6 times
  drawLargeFin(direction);
}

void drawLargeFin(int direction) {
}

void drawCenterKnob() {}