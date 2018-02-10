// starting positions of the reset button
// 334, 800

int BUTTON_x = 80;
int BUTTON_y = 730;
int BUTTON_OFFSET = 7;
int BUTTON_WIDTH = 100;
int BUTTON_HEIGHT = 50;
String BUTTON_NAME = "Reset";

void buttonsDefaults() {
  
}
void drawButtons() {
  
  textSize(32);
  fill(0);
  noFill();
  strokeWeight(3);
  rect(BUTTON_x, BUTTON_y, BUTTON_WIDTH, BUTTON_HEIGHT);
  text(BUTTON_NAME, BUTTON_x + BUTTON_OFFSET, BUTTON_y, 100, 200);
  strokeWeight(1);
}

// if mouse is over reset button or thickness button, then no blur should happen
void overButton(){
  if (mouseX >= BUTTON_x && mouseX <= BUTTON_x+width && 
      mouseY >= BUTTON_y && mouseY <= BUTTON_y+height) {
      noFill();
      noStroke();
      // no color picker
  } else {
    
    // set defaults
  }
  
}