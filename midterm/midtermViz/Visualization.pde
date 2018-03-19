abstract class Visualization{
  Table inputData;
  PImage vizImage;
  int ww;
  int hh;
  int startX;
  int startY;

  Visualization(){
    ww = 1100;
    hh = 700;
    startX = 0;
    startY = 0;
  }
  abstract void draw(Table inputData);
  abstract int getVizualizationNum();
  abstract String getHeading();
  void inCircle(float circleX, float circleY, float RadiusOfcirle, float homicide, float suicide, float guns, String country, float gdp){
    int offset=20;
    if(circleX+circleY<=RadiusOfcirle){
         if(homicide*200+10<=width-200){
           if(height*0.8-gdp/180>25){
              fill(128,0,64);
              textAlign(LEFT);
              textSize(12);
              text(country,homicide*200+10+guns,height*0.8-gdp/180-guns);
              text("Homicide per 100k "+homicide,homicide*200+10+guns,height*0.8-gdp/180-guns+offset);
              text("Suicide per 100k "+suicide,homicide*200+10+guns,height*0.8-gdp/180-guns-20+offset*3);
              text("Guns per 100 people "+guns,homicide*200+10+guns,height*0.8-gdp/180-guns-20+offset*4);
              text("GDP per capita "+gdp,homicide*200+10+guns,height*0.8-gdp/180-guns-20+offset*5);
           }
           else{
              fill(128,0,64);
              textAlign(LEFT);
              textSize(12);
              text(country,homicide*200+10-guns*2,offset);
              text("Homicide per 100k "+homicide,homicide*200+10-guns*2,offset*2);
              text("Suicide per 100k "+suicide,homicide*200+10-guns*2,offset*3);
              text("Guns per 100 people "+guns,homicide*200+10-guns*2,offset*4);
              text("GDP per capita "+gdp,homicide*200+10-guns*2,offset*5);
             
           }
         }
         else{
           if(height*0.8-gdp/180>25){
              fill(128,0,64);
              textAlign(LEFT);
              textSize(12);
              text(country,width-300,height*0.8-gdp/180-guns);
              text("Homicide per 100k "+homicide,width-300,height*0.8-gdp/180-guns+offset);
              text("Suicide per 100k "+suicide,width-300,height*0.8-gdp/180-guns-20+offset*3);
              text("Guns per 100 people "+guns,width-300,height*0.8-gdp/180-guns-20+offset*4);
              text("GDP per capita "+gdp,width-300,height*0.8-gdp/180-guns-20+offset*5);
           }
           else{
              fill(128,0,64);
              textAlign(LEFT);
              textSize(12);
              text(country,width-300,offset);
              text("Homicide per 100k "+homicide,width-300,offset*2);
              text("Suicide per 100k "+suicide,width-300,offset*3);
              text("Guns per 100 people "+guns,width-300,offset*4);
              text("GDP per capita "+gdp,width-300,offset*5);
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