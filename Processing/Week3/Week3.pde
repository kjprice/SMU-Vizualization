// Based on http://www.woodthatworks.com/kinetic-sculptures/nautilus.html

float centerKnobRadius;
float smallFinCenterRadius;
int absoluteCenterX;
int absoluteCenterY;
int originX;
int originY;

color smallFinColor;
float[] theta;
float[] rotSpd;

void setup() {
  size(500, 500, P3D);
  noStroke();
  // noLoop();
  originX = 0;
  originY = 0;
  absoluteCenterX = width / 2;
  absoluteCenterY = height / 2;
  
  smallFinColor = color(230, 210, 180);
  
  centerKnobRadius = width *.05;
  smallFinCenterRadius = width *.10;
  
  rotSpd = new float[]{ PI/180, -PI/180 };
  theta = new float[]{ 10, 0 };
}

void draw() {
  translate(absoluteCenterX, absoluteCenterY);
  background(250, 250, 245);
  
  // Clockwise rotation
  drawAxis(0);
  // Anti Clockwise rotation
  drawAxis(1);
  
  drawCenterKnob();
}

void drawAxis(int index) {
  int direction = (index == 0 ? 1 : -1);

  pushMatrix();
  rotate(theta[index]);
  drawLargeFin(direction);
  drawSmallFin(direction);
  drawSmallFinCenter();
  popMatrix();

  theta[index] += rotSpd[index];
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