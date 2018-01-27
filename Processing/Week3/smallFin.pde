
// (x,y) coordinate on a circle perimeter : (TranslatedCenterX + radius * cos(angle), TranslatedCenterY + radius * sin(angle))


void drawSmallFin(int direction) {
  
  float radius = width*.87/2 ; //Radius of the outermost tip of the fin
  
  int rot = direction; // ClockWise or Anticlockwise : Default clockwise
  float deg = 185;     //starting position of the 1st Fin at center
  
  float[] rad = {radius*1/5,radius*2/5,radius*3/5,radius*4/5,radius}; // Number of samples circles taken from the center points
  int grd = 20*rot;        // rotation required as we go to outer circle
  
  fill(200,200,200);   // Colour of the small fins
 
  //Each loop for 6 fins
  fill(230, 210, 180);
  for(int fin=0; fin < 6 ; fin++) {
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
    endShape();
    deg = deg+18;     // Space between two fins
   }
    
}