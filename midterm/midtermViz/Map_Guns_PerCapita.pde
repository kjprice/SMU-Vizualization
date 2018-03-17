public class MapGunsPerCapita extends Visualization {
  int vizualizationNum = 1;
  int ww = 1000;
  int hh = 700;
  int startX = 0;
  int startY = 0;
  PImage mapimg;
  PImage vizImage; // the rendered/cached version of this visual
  String heading = "Gun availability Per Capita of Country ";
  
  MapGunsPerCapita() {
    //super("Guns Per Capita", "Gun availability Per Capita of Country");
  }

  float mercX(float lon) {
    lon = radians(lon);
    float a = (256 / PI) * pow(2, zoom);
    float b = lon + PI;
    return a * b;
  }
  
  float mercY(float lat) {
    lat = radians(lat);
    float a = (256 / PI) * pow(2, zoom);
    float b = tan(PI / 4 + lat / 2);
    float c = PI - log(b);
    return a * c;
  }

  void draw(Table inputData){
    if (this.vizImage != null) {
      this.drawVizImage();
    }
    else {
      this.drawMap(inputData);
      this.createVizImage();
    }
  }
  
  void drawVizImage() {
    imageMode(CORNERS);
    image(this.vizImage, this.startX, this.startY);
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

  void drawMap(Table inputData) {
    mapimg = loadImage("earth.jpg");
    mapimg.resize(ww,hh);
    text("Heading ",ww / 2,10);
    translate(ww / 2, hh / 2);
    imageMode(CENTER);
    image(mapimg, 0, 0);
  
    float cx = mercX(clon);
    float cy = mercY(clat);
    for (TableRow row : inputData.rows()) {
      float lat = row.getFloat("latitude");
      float lon = row.getFloat("longitude");
      float GunsPerCapita = row.getFloat("Guns per 100");//Guns.Per.Capita
      String country = row.getString("Country");
      // I want to use this value to add a thick stroke width for circle for developed. 
      // not working
      String economy = trim(row.getString("Developed"));
      int stroke_W = 1;
      // display data of developed country only
      if (economy.equals("yes") == true) {
          //stroke_W = 5;
      //}
          float x = mercX(lon) - cx;
          float y = mercY(lat) - cy;
          
          // This addition fixes the case where the longitude is non-zero and
          // points can go off the screen.
          if(x < - ww/2) {
            x += ww;
          } else if(x > ww / 2) {
            x -= ww;
          }
          
          // scale circle to match variable
          float mag = GunsPerCapita * pow(10, 7);
          mag = sqrt(mag);
          float magmax = sqrt(pow(10, 10));
          float d = map(mag, 0, magmax, 0, 180);
          
          // draw circle and change thickness
          stroke(0, 0, 123);
          strokeWeight(stroke_W);
          fill(55, 123, 55, 200);
          ellipse(x, y, d, d);
          
          // show country name
          fill(255, 10, 10, 200);
          textAlign(LEFT);
          textSize(12);
          text(country,x,y);
      }// end if economy = yes
    }
  }

  void showLegends(){
    // TODO
  }
  int getVizualizationNum(){
    return vizualizationNum;
  }
  String getHeading(){
    return heading;
  }
}