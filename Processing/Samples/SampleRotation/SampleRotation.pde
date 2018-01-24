float x, y, w;
float spdX, spdY, theta, theta2, rotSpd, rotSpd2;

void setup() {
  size(600, 600);
// initialize global variables
  x = width/2;
  y = height/2;
  w = 150;
 
  //spdX = 2.5;
  //spdY = 1.5;
  rotSpd = PI/180;
  rotSpd2 = -PI/180;

  noStroke();
} 

void draw() {
  background(255, 127, 100);
  
  pushMatrix();
  translate(x, y);
  rotate(theta);
  fill(175, 175, 0);
  rect(-w/2, -w/2, w, w);
  popMatrix();
  
  pushMatrix();
  translate(x, y);
  rotate(theta2);
  fill(175, 0, 175);
  rect(-w/4, -w/4, w/2, w);
  popMatrix();
  
  //x += spdX;
  //y += spdY;
  theta += rotSpd;
  theta2 += rotSpd2;
} 