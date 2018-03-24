abstract class Visualization{
  Table inputData;
  PImage vizImage;
  int ww;
  int hh;
  int startX;
  int startY;
  int textX=480;
  int textY=350;

  Visualization(){
    ww = 1000;//1100
    hh = 650;//700
    startX = 0;
    startY = 0;
  }
  abstract void draw(Table inputData);
  abstract int getVizualizationNum();
  abstract String getHeading();
  void inCircle(float circleX, float circleY, float RadiusOfcirle, float homicide, float suicide, float guns, String country, float gdp){
    int offset=20;
    if(circleX+circleY<=RadiusOfcirle){
           //text window
         fill(255);
         strokeWeight(1);
         rect(textX-10,textY-20,180,150);
         if(homicide*200+10<=width-200){
           if(height*0.8-gdp/180>25){
              fill(128,0,64);
              textAlign(LEFT);
              textSize(12);
              text(country,textX,textY);
              text("Homicide per 100k "+homicide,textX,textY+offset*2);
              text("Suicide per 100k "+suicide,textX,textY+offset*3);
              text("Guns per 100 people "+guns,textX,textY+offset*4);
              text("GDP per capita "+gdp,textX,textY+offset*5);
           }
           else{
              fill(128,0,64);
              textAlign(LEFT);
              textSize(12);
              text(country,textX,textY,offset);
              text("Homicide per 100k "+homicide,textX,textY+offset*2);
              text("Suicide per 100k "+suicide,textX,textY+offset*3);
              text("Guns per 100 people "+guns,textX,textY+offset*4);
              text("GDP per capita "+gdp,textX,textY+offset*5);
             
           }
         }
         else{
           if(height*0.8-gdp/180>25){
              fill(128,0,64);
              textAlign(LEFT);
              textSize(12);
              text(country,textX,textY);
              text("Homicide per 100k "+homicide,textX,textY+offset*2);
              text("Suicide per 100k "+suicide,textX,textY+offset*3);
              text("Guns per 100 people "+guns,textX,textY+offset*4);
              text("GDP per capita "+gdp,textX,textY+offset*5);
           }
           else{
              fill(128,0,64);
              textAlign(LEFT);
              textSize(12);
              text(country,textX,textY+offset);
              text("Homicide per 100k "+homicide,textX,textY+offset*2);
              text("Suicide per 100k "+suicide,textX,textY+offset*3);
              text("Guns per 100 people "+guns,textX,textY+offset*4);
              text("GDP per capita "+gdp,textX,textY+offset*5);
            }
         }
       }
  }
  void prerender(Table inputData) {
  }
  void createVizImage() {
    this.vizImage = createImage(this.ww, this.hh, RGB);
    this.vizImage.loadPixels();
    loadPixels();
    
    int widthOffset = width - this.ww;
    
    for (int x = 0; x < this.ww; x++) {
      for (int y = 0; y < this.hh; y++) {
        int locViz = (x + this.startX) + ((y + this.startY) * this.ww);
        // our map does not fill the entire screen - so deduct the actual width when scaping pixels
        int locCanvas = locViz + (widthOffset * y);
        // pull pixels directly on screen and write to vizImage
        this.vizImage.pixels[locViz] = pixels[locCanvas];
      }
    }
    
    this.vizImage.updatePixels();
  }

  void drawVizImage() {
    imageMode(CORNERS);
    image(this.vizImage, this.startX, this.startY);
  }
}