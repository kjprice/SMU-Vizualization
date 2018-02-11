// Description: Display two rectangle boxes with varying size. Keep on click activated. on click check if the click was in range
// of the two rectangle boxes. based on the range either select a different blurWidth or the mouse was clicked elsewhere.

// starting positions of the brush width. We are using 2 blurWidth.
// blurWidth a thin liner
float bx_a = 210;
float by_a = 740;

// blurWidth b slightly thicker
float bx_b = 210;
float by_b = 760;

// Since we need location of the brush, we are using rectangles to show blurWidth.
// thin line a box
int box_width_a = 15;
float box_height_a =2;

// thicker line b box
int box_width_b = 15;
float box_height_b =3;

// blurWidth of brush 
// At run time we can change the blurWidth to thinner or thicker than default
int blurWidth = 10;
int blurWidth_a = 3;
int blurWidth_b = 15;
int blurWidth_BOX = 50;

void blurWidthDefaults() {
  blurWidth = 10;
}
void drawBlurWidthOptions() {
  
  strokeWeight(3);
  stroke(0);
  //outer rectangle
  rect(bx_a - 15 , by_a - 10, blurWidth_BOX, blurWidth_BOX);
  
  // thin line
  strokeWeight(blurWidth_a);
  rect(bx_a, by_a, box_width_a, box_height_a);
  
  // thick line
  strokeWeight(blurWidth_b);
  rect(bx_b, by_b, box_width_b, box_height_b);
  
 // reset strokes 
  strokeWeight(1);
  stroke(0);
}

boolean checkBlurWidthUserChanged() {
  boolean buttonClicked = false;
    // events for selection of width
  strokeWeight(0);
  if (mouseX >= bx_a && 
      mouseX <= bx_a+box_width_a && 
      mouseY >= by_a && 
      mouseY <= by_a+box_height_a) 
   {
    println("blurWidth selected is a");
      noFill();
      blurWidth = blurWidth_a;
      buttonClicked = true;
  } else 
    if (mouseX >= bx_b && 
        mouseX <= bx_b+box_width_b && 
        mouseY >= by_b && 
        mouseY <= by_b+box_height_b
        )
  {
    noFill();
    blurWidth = blurWidth_b;
    buttonClicked = true;
  }
  
  return buttonClicked;
}