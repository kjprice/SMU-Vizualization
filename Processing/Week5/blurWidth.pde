// Description: Display two rectangle boxes with varying size. Keep on click activated. on click check if the click was in range
// of the two rectangle boxes. based on the range either select a different thickness or the mouse was clicked elsewhere.

// starting positions of the brush width. We are using 2 thickness.
// thickness a thin liner
float bx_a = 210;
float by_a = 740;

// thickness b slightly thicker
float bx_b = 210;
float by_b = 760;

// Since we need location of the brush, we are using rectangles to show thickness.
// thin line a box
int box_width_a = 15;
float box_height_a =2;

// thicker line b box
int box_width_b = 15;
float box_height_b =3;

// thickness of brush 
// At run time we can change the thickness to thinner or thicker than default
int THICKNESS = 10;
int THICKNESS_a = 3;
int THICKNESS_b = 15;
int THICKNESS_BOX = 50;

void blurWidthDefaults() {
  THICKNESS = 10;
}
void drawBlurWidthOptions() {
  
  strokeWeight(3);
  stroke(0);
  //outer rectangle
  rect(bx_a - 15 , by_a - 10, THICKNESS_BOX, THICKNESS_BOX);
  
  // thin line
  strokeWeight(THICKNESS_a);
  rect(bx_a, by_a, box_width_a, box_height_a);
  
  // thick line
  strokeWeight(THICKNESS_b);
  rect(bx_b, by_b, box_width_b, box_height_b);
  
 // reset strokes 
  strokeWeight(1);
  stroke(0);
}