//  Here we listen to keyboard and mouse events and will call functions based on user interactions

boolean mouseMoved = false;

void keyPressed() {
  if (key == ESC) {
    colorIsSet = false;
    key = 0; // trap esc so it doesn't quit https://processing.org/discourse/beta/num_1276201899.html
  }
}

// only one mouse click event can be consumed at a time
void mouseClicked() {
  if (checkBlurWidthUserChanged()) {
    return;
  }
  if (checkResetButtonClicked()) {
     return;
  }
  
  // if none of the buttons were clicked, then we selected a color or are bluring (which is handled in the draw method)
  if (!colorIsSet) {
    colorIsSet = true;
  }  
}

void mouseMoved() {
  // we do not want to draw the color picker until user has hovered over a color
  mouseMoved = true;
}