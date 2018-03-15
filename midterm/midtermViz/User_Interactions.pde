
void mouseClicked() {
  println("Mouse clicked");
  println(mouseX, mouseY,button_start_x,button_start_x+button_w, button_start_y,button_start_y+button_h);
  // first button  
  if (
      mouseX >= button_start_x && 
      mouseX <= button_start_x+button_w && 
      mouseY >= button_start_y && 
      mouseY <= button_start_y+button_h
    ) {
      heading = "Gun availability Per Capita of Country ";
      vizToDisplay = 1;
      println("first button");
      
    }
  else if (
      mouseX >= button_start_x + offset && 
      mouseX <= button_start_x +offset +button_w && 
      mouseY >= button_start_y && 
      mouseY <= button_start_y+button_h
    ) {
      
      heading = " Top 10 countries by GDP ";
      vizToDisplay = 2;
      println("2nd button");
    }
    else if (
      mouseX >= button_start_x + (offset *2) && 
      mouseX <= button_start_x + (offset *2) +button_w && 
      mouseY >= button_start_y && 
      mouseY <= button_start_y+button_h
    ) {
      
      heading = " What comes here? ";
      vizToDisplay = 3;
      println("3nd button");
    }
    else if (
      mouseX >= button_start_x + (offset *3) && 
      mouseX <= button_start_x + (offset *3) +button_w && 
      mouseY >= button_start_y && 
      mouseY <= button_start_y+button_h
    ) {
      
      heading = " 4th viz ";
      vizToDisplay = 4;
      println("4th button");
    }
    else if (
      mouseX >= button_start_x + (offset *4) && 
      mouseX <= button_start_x + (offset *4) +button_w && 
      mouseY >= button_start_y && 
      mouseY <= button_start_y+button_h
    ) {
      
      heading = " 5th Viz ";
      vizToDisplay = 5;
      println("5th button");
    }
}