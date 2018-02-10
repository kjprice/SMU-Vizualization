//  Here we listen to keyboard and mouse events and will call functions based on user interactions

boolean mouseMoved = false;

void keyPressed() {
  if (key == ESC) {
    colorIsSet = false;
    key = 0; // trap esc so it doesn't quit https://processing.org/discourse/beta/num_1276201899.html
  }
}

void mouseClicked() {
  if (!colorIsSet) {
    colorIsSet = true;
  }
  // events for selection of width
  strokeWeight(0);
 // text( "x: " + mouseX + " y: " + mouseY, mouseX, mouseY );
 // println("mouseX",mouseX,"mouseY",mouseY);
  if (mouseX >= bx_a && 
      mouseX <= bx_a+box_width_a && 
      mouseY >= by_a && 
      mouseY <= by_a+box_height_a) 
   {
      noFill();
      THICKNESS = THICKNESS_a;
  } else 
    if (mouseX >= bx_b && 
        mouseX <= bx_b+box_width_b && 
        mouseY >= by_b && 
        mouseY <= by_b+box_height_b
        )
  {
    //println("thickness selected is b");
    noFill();
    THICKNESS = THICKNESS_b;
  } else
  // on click of reset
  if (
      mouseX >= BUTTON_x && 
      mouseX <= BUTTON_x+BUTTON_WIDTH && 
      mouseY >= BUTTON_y && 
      mouseY <= BUTTON_y+BUTTON_HEIGHT
      ) {
        // println("inside reset");
          loadImageToFix();
          drawImage();
          setColorPickerDefaults();
    }
  
}

void mouseMoved() {
  // we do not want to draw the color picker until user has hovered over a color
  mouseMoved = true;
}