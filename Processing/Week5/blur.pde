//this function will create a blur
//http://learningprocessing.com/examples/chp15/example-15-13-Convolution
float[][] matrix = {{1,4,6,4,1},
                   {4,16,24,16,4},
                   {6,24,36,24,6},
                   {4,16,24,16,4},
                   {1,4,6,4,1}};
int matrixsize = 5;
void blur (float r){
  float x = mouseX;
  float y = mouseY;
  float blurRed = red(selectedColor);
  float blurGreen = green(selectedColor);
  float blurBlue = blue(selectedColor);
  float[] xWithinCircle = new float [int(PI*sq(r)*1.2)];
  float[] yWithinCircle = new float [int(PI*sq(r)*1.2)];
  if (!colorIsSet) {
   return;
   }
   else{
     if(mousePressed == true){
        selectedImage.loadPixels();
        //get pixels within mixing circle
        //https://stackoverflow.com/questions/14487322/get-all-pixel-array-inside-circle
        for (int x1=int(x-r); x1<=int(x+r); x1++){
          for (int y1=int(y-r); y1<=int(y+r); y1++){
            float dx = x1 - x;
            float dy = y1 - y;
            float distanceSquared = sq(dx) + sq(dy);
            //change colors within mixing circle
            if (distanceSquared <= sq(r)){
              for (int i=0; i<int(PI*sq(r)); i++){
                  xWithinCircle[i] = x1;
                  yWithinCircle[i] = y1;
                  color pixelColor = get(x1, y1);
                  float rPixel = red(pixelColor);
                  float gPixel = green(pixelColor);
                  float bPixel = blue(pixelColor);
                  float red = (rPixel+blurRed)/2;
                  float green = (gPixel+blurGreen)/2;
                  float blue = (bPixel+blurBlue)/2;
                  println();//have no idea why it doesn't work without the print statement
                  selectedImage.pixels[x1+y1*width] = color (red, green, blue);
                  color c = convolution(x1,y1,matrix,matrixsize,selectedImage); 
                  int loc = x1+y1*width;
                  selectedImage.pixels[loc] = c;
                    }
                
             }
            }
          }
          }
          //shows area to make changes to color
          else{
            fill(selectedColor, 50);
            ellipse(x,y,r*2,r*2);
       }
  }
  selectedImage.updatePixels();
}
void setBlurDefaults() {
  blurWidth = 1;
}

color convolution(int x, int y, float[][] matrix, int matrixsize, PImage img) {
  float rtotal = 0.0;
  float gtotal = 0.0;
  float btotal = 0.0;
  int offset = matrixsize / 2;
  
  // Loop through convolution matrix
  for (int i = 0; i < matrixsize; i++ ) {
    for (int j = 0; j < matrixsize; j++ ) {
      
      // What pixel are we testing
      int xloc = x + i-offset;
      int yloc = y + j-offset;
      int loc = xloc + img.width*yloc;
      
      // Make sure we haven't walked off the edge of the pixel array
      // It is often good when looking at neighboring pixels to make sure we have not gone off the edge of the pixel array by accident.
      loc = constrain(loc,0,img.pixels.length-1);
      
      // Calculate the convolution
      // We sum all the neighboring pixels multiplied by the values in the convolution matrix.
      rtotal += (red(img.pixels[loc]) * matrix[i][j])/256;
      gtotal += (green(img.pixels[loc]) * matrix[i][j])/256;
      btotal += (blue(img.pixels[loc]) * matrix[i][j])/256;
    }
  }
  
  // Make sure RGB is within range
  rtotal = constrain(rtotal,0,255);
  gtotal = constrain(gtotal,0,255);
  btotal = constrain(btotal,0,255);
  
  // Return the resulting color
  return color(rtotal,gtotal,btotal); 
}