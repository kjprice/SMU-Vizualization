// starting positions of the reset button
// 334, 800

int button_x = 80;
int button_y = 730;
int buttonOffset = 7;
int buttonWidth = 100;
int buttonHeight = 50;
String buttonName = "Reset";

void buttonsDefaults() {
  
}
void drawButtons() {
  
  textSize(32);
  fill(0);
  noFill();
  strokeWeight(3);
  rect(button_x, button_y, buttonWidth, buttonHeight);
  text(buttonName, button_x + buttonOffset, button_y, 100, 200);
  strokeWeight(1);
}

// if mouse is over reset button or thickness button, then no blur should happen
void overButton(){
  if (mouseX >= button_x && mouseX <= button_x+width && 
      mouseY >= button_y && mouseY <= button_y+height) {
      noFill();
      noStroke();
      // no color picker
  } else {
    
    // set defaults
  }
  
}

boolean checkResetButtonClicked() {
  if (
      mouseX >= button_x && 
      mouseX <= button_x+buttonWidth && 
      mouseY >= button_y && 
      mouseY <= button_y+buttonHeight
      ) {
        // println("inside reset");
          loadImageToFix();
          drawImage();
          setColorPickerDefaults();
          setBlurDefaults();
          return true;
    }
    
    return false;
}