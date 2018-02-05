final static int SPACE = 32;

void keyPressed() {
  if (keyCode == RIGHT) {
    rightArrowPressed = true;
  }
  if (keyCode == LEFT) {
    leftArrowPressed = true;
  }
  if (keyCode == SPACE) {
    performJump();
  }
}


void keyReleased() {
  if (keyCode == RIGHT) {
    rightArrowPressed = false;
  }
  if (keyCode == LEFT) {
    leftArrowPressed = false;
  }
}