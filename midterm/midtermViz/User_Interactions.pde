
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
      println("first button");
      
    }
  if (
      mouseX >= button_start_x + offset && 
      mouseX <= button_start_x +offset +button_w && 
      mouseY >= button_start_y && 
      mouseY <= button_start_y+button_h
    ) {
      
      heading = " How do i reset the heading??? :( ";
      println("2nd button");
    }
}