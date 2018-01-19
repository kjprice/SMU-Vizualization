void setup() {
  // Create same dimensions as original painting (30 X 50.1cm)
  size(751, 450);
  noLoop();
  noStroke();
}

void draw() {
  background(70, 64, 37);
  drawBackground();
  drawForgroundShadows();
  drawForeground3d();
  drawRedBar(); 
}

void drawBackground() {
  drawTopLeftBackground();
  drawTopBackground();
  drawTopRightBackground();
  drawCenterBackground();
}

float calculateRectWidth(int widthFromRect) {
  // each rectangle's width should be calculated based on this image https://i0.wp.com/thecharnelhouse.org/wp-content/uploads/2013/11/peter-keler-wall-painting-scheme-for-laszlo-moholy-nagys-studio-weimar-1925-gouache-on-paper-30-x-50-1cm.jpeg?zoom=2&fit=1200%2C913&ssl=1
  return width * widthFromRect / 1000;
}

float calculateRectHeight(int heightFromRect) {
  return  height * heightFromRect / 762;
}

int calculateLeftPosition(int originalLeft) {
  // originalLeft taken from original image
  return originalLeft * width / 1000;
}

int calculateTopPosition(int originalTop) {
  // originalTop taken from original image
  return originalTop * height / 762;
}

void drawTopLeftBackground() {
  // Approximate ratio 380/1000 X 400 / 762
  float rectHeight = calculateRectHeight(415);
  float rectWidth = calculateRectWidth(380);
  fill(150, 160, 111);
  rect(0, 0, rectWidth, rectHeight);
}

void drawTopBackground() {
  float rectWidth = calculateRectWidth(356);
  float rectHeight = calculateRectHeight(138);
  int leftPosition = calculateLeftPosition(380);
  fill(40, 36, 13);
  rect(leftPosition, 0, rectWidth, rectHeight);
}

void drawTopRightBackground() {
  float rectWidth = calculateRectWidth(269);
  float rectHeight = calculateRectHeight(532);
  int leftPosition = calculateLeftPosition(732);
  fill(1, 1, 1);
  rect(leftPosition, 0, rectWidth, rectHeight);  
}

void drawCenterBackground() {
  float rectWidth = calculateRectWidth(707);
  float rectHeight = calculateRectHeight(395);
  int leftPosition = calculateLeftPosition(291);
  int topPosition = calculateTopPosition(138);
  fill(2, 3, 1);
  rect(leftPosition, topPosition, rectWidth, rectHeight);  
}

void drawRedBar() {
  float rectWidth = calculateRectWidth(590);
  float rectHeight = calculateRectHeight(22);
  int leftPosition = calculateLeftPosition(67);
  int topPosition = calculateTopPosition(282);
  fill(123, 9, 10);
  rect(leftPosition, topPosition, rectWidth, rectHeight);  
}

void drawForeground3d() {
  drawLeftRectangle3d();
  drawRightRectangle3d();
  drawCenterRectangle3d();
}

void drawLeftRectangle3d() {
  float rectWidth = calculateRectWidth(94);
  float rectHeight = calculateRectHeight(373);
  int leftPosition = calculateLeftPosition(45);
  int topPosition = calculateTopPosition(44);
  fill(212, 200, 188);
  rect(leftPosition, topPosition, rectWidth, rectHeight);
  // create quad behind 3d rectangle
  float left1PositionQuad = leftPosition + rectWidth;
  float top1PositionQuad = topPosition;
  float left2PositionQuad = calculateLeftPosition(206);
  float top2PositionQuad = calculateTopPosition(155);
  float left3PositionQuad = left2PositionQuad;
  float top3PositionQuad = topPosition + rectHeight;
  float left4PositionQuad = left1PositionQuad;
  float top4PositionQuad = top3PositionQuad;
  fill(43, 20, 7);
  quad(
    left1PositionQuad,
    top1PositionQuad,
    left2PositionQuad,
    top2PositionQuad,
    left3PositionQuad,
    top3PositionQuad,
    left4PositionQuad,
    top4PositionQuad
  );
}

void drawRightRectangle3d() {
  float rectWidth = calculateRectWidth(15);
  float rectHeight = calculateRectHeight(704);
  int leftPosition = calculateLeftPosition(956);
  int topPosition = calculateTopPosition(18);
  fill(212, 200, 188);
  rect(leftPosition, topPosition, rectWidth, rectHeight);
  // create quad behind 3d rectangle
  float left1PositionQuad = calculateLeftPosition(762);
  float top1PositionQuad = calculateTopPosition(97);
  float left2PositionQuad = leftPosition;
  float top2PositionQuad = topPosition;
  float left3PositionQuad = left2PositionQuad;
  float top3PositionQuad = topPosition + rectHeight;
  float left4PositionQuad = left1PositionQuad;
  float top4PositionQuad = calculateTopPosition(601);
  fill(68, 43, 30);
  quad(
    left1PositionQuad,
    top1PositionQuad,
    left2PositionQuad,
    top2PositionQuad,
    left3PositionQuad,
    top3PositionQuad,
    left4PositionQuad,
    top4PositionQuad
  );
}

void drawCenterRectangle3d() {
  float rectWidth = calculateRectWidth(800);
  float rectHeight = calculateRectHeight(18);
  int leftPosition = calculateLeftPosition(114);
  int topPosition = calculateTopPosition(576);
  fill(212, 200, 188);
  rect(leftPosition, topPosition, rectWidth, rectHeight);
  // create quad behind 3d rectangle
  float left1PositionQuad = calculateLeftPosition(196);
  float top1PositionQuad = calculateTopPosition(444);
  float left2PositionQuad = calculateLeftPosition(621);
  float top2PositionQuad = top1PositionQuad;
  float left3PositionQuad = calculateLeftPosition(913);
  float top3PositionQuad = topPosition;
  float left4PositionQuad = leftPosition;
  float top4PositionQuad = top3PositionQuad;
  fill(120, 100, 95);
  quad(
    left1PositionQuad,
    top1PositionQuad,
    left2PositionQuad,
    top2PositionQuad,
    left3PositionQuad,
    top3PositionQuad,
    left4PositionQuad,
    top4PositionQuad
  );
}

void drawForgroundShadows() {
  float left1PositionQuad = calculateLeftPosition(126);
  float top1PositionQuad = calculateTopPosition(528);
  float left2PositionQuad = calculateLeftPosition(427);
  float top2PositionQuad = top1PositionQuad;
  float left3PositionQuad = calculateLeftPosition(507);
  float top3PositionQuad = calculateTopPosition(680);
  float left4PositionQuad = calculateLeftPosition(18);
  float top4PositionQuad = top3PositionQuad;
  fill(1, 1, 1);
  quad(
    left1PositionQuad,
    top1PositionQuad,
    left2PositionQuad,
    top2PositionQuad,
    left3PositionQuad,
    top3PositionQuad,
    left4PositionQuad,
    top4PositionQuad
  );
}