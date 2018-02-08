//this function will create a blur
void blur (float r){
  float x = mouseX;
  float y = mouseY;
  if (!colorIsSet) {
   return;
   }
   else{
     if(mousePressed == true){
        selectedImage.loadPixels();
        //get pixels within mixing circle
        //https://stackoverflow.com/questions/14487322/get-all-pixel-array-inside-circle
        float blurRed = red(selectedColor);
        float blurGreen = green(selectedColor);
        float blurBlue = blue(selectedColor);
        for (int x1=int(x-r); x1<=int(x+r); x1++){
          for (int y1=int(y-r); y1<=int(y+r); y1++){
            float dx = x1 - x;
            float dy = y1 - y;
            float distanceSquared = sq(dx) + sq(dy);
            //change colors within mixing circle
            if (distanceSquared <= sq(r)){
              for (int i=0; i<int(PI*sq(r)); i++){
                  //xWithinCircle[i] = x1;
                  //yWithinCircle[i] = y1;
                  color pixelColor = get(x1, y1);
                  float rPixel = red(pixelColor);
                  float gPixel = green(pixelColor);
                  float bPixel = blue(pixelColor);
                  float red = (rPixel+blurRed)/2;
                  float green = (gPixel+blurGreen)/2;
                  float blue = (bPixel+blurBlue)/2;
                  println("red, green, blue", red, green, blue);
                  println("original color", rPixel, gPixel, bPixel);
                  println("chosen color", blurRed, blurGreen, blurBlue);
                  selectedImage.pixels[x1+y1*width] = color (red, green, blue);
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