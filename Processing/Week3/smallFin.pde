
// part of setup - multiple strategies to choose from
void createSmallFinColor() {
  // predefine colors by axis here
  int axisColors[] = new int[] {
    color(220, 200, 170),
    color(240, 220, 190)
  };
  for (int i = 0; i < NUMBER_AXISES; i++) {
    // use random colors for access here
    // int axisColor = color(random(220, 240), random(200, 220), random(170, 190));
    int axisColor = axisColors[i];
    for (int n = 0; n < NUMBER_SMALL_FINS; n++) {
      // give random colors to each fin
      //smallFinColorsByAxis[i][n] = color(random(225, 235), random(205, 215), random(175, 185));
      // sinply use smallFinColorBase for all fins
      //smallFinColorsByAxis[i][n] = smallFinColorBase;
      // define each fin based on the axis they are on
      smallFinColorsByAxis[i][n] = axisColor;
    }
  }
}


void drawSmallFin(int direction) {
  int axisIndex = (direction == 1 ? 0 : 1);
  
  float radius = width*.87/2 ; //Radius of the outermost tip of the fin
  
  int rot = direction; // ClockWise or Anticlockwise : Default clockwise
  float deg = 185;     //starting position of the 1st Fin at center
  
  float[] rad = {radius*1/5,radius*2/5,radius*3/5,radius*4/5,radius}; // Number of samples circles taken from the center points
  int grd = 20*rot;        // Control the curve of the small fin. Increase to have move curved fin.
  
  //fill(200,200,200);   // Colour of the small fins
 
  //Each loop for 6 fins
  for(int fin=0; fin < NUMBER_SMALL_FINS; fin++) {
    fill(smallFinColorsByAxis[axisIndex][fin]);
    beginShape();
    curveVertex(originX,originY);
    curveVertex(originX,originY);
    // each loop from center to outer edge
    for(int i=0; i < rad.length ; i++) {
      curveVertex(originX + rad[i] * cos(radians(deg+(grd*i))), originX + rad[i]*sin(radians(deg+(grd*i))));
      }
    deg = deg + 10;    // Width of the fin
    // each loop from outer edge to center
    for (int i=rad.length-1; i >=0 ; i--) {
    curveVertex(originX + rad[i]*cos(radians(deg+(grd*i))), originX + rad[i]*sin(radians(deg+(grd*i))));
      }
    curveVertex(originX,originY);
    curveVertex(originX,originY);
    endShape();
    deg = deg+18;     // Space between two fins
   }
    
}