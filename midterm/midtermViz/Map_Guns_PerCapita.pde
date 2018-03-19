public class MapGunsPerCapita extends Visualization {
  private int clat = 0;
  private int clon = 0;
  private int zoom = 1;
  int vizualizationNum = 1;
  PImage mapimg=loadImage("earth.jpg");
  PImage vizImage; // the rendered/cached version of this visual
  String heading = "Guns-homicide per capita of developed countries ";
  
  // co-ordniates of white area of the map. This is where i am placing heading
  float heading_lat = -75;
  float heading_lon = -100;
  
  //legends
  float legend_lat = -0;
  float legend_lon = -170;
  
  //circle
  float d;
  float x;
  float y;
  
  MapGunsPerCapita() {
    super();
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

  //void prerender(Table inputData) {
  //  this.drawMap(inputData);
  //  this.createVizImage();
  //}

  //void draw(Table inputData){
  //  this.drawVizImage();
  //}

  void draw(Table inputData) {
    pushMatrix();
    //mapimg = loadImage("earth.jpg");
    mapimg.resize(ww,hh);
    translate(ww / 2, hh / 2);
    imageMode(CENTER);
    image(mapimg, 0, 0);
  
    float cx = mercX(clon);
    float cy = mercY(clat);
   // println("***************cx",cx,cy);
    // set heading
    setHeading();
    
    for (TableRow row : inputData.rows()) {
      float lat = row.getFloat("latitude");
      float lon = row.getFloat("longitude");
      float GunsPerCapita = row.getFloat("Guns per 100");
      String country = row.getString("Country");
      float homicide = row.getFloat("Homicide per 100k");
      int stroke_W = round(homicide);
      //filter out non-developed countries 
      String economy = trim(row.getString("Developed"));
            
      // display data of developed country only
      if (economy.equals("yes") == true) {
          //stroke_W = 5;
      //}
          x = mercX(lon) - cx;
          y = mercY(lat) - cy;
          
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
          d = map(mag, 0, magmax, 0, 180);
          
          // draw circle and change thickness
          stroke(0, 0, 123);
          strokeWeight(stroke_W);
          fill(55, 123, 55, 200);
          ellipse(x, y, d, d);
          
          // show country name
          fill(255, 10, 10, 200);
          textAlign(LEFT);
          textSize(13);
          text(country,x,y);
          
      }// end if economy = yes
    }
    showLegends();
    popMatrix();
  }

  void showLegends(){
    // set co-ordinates on map where legend needs to be places.
    float cx = mercX(clon);
    float cy = mercY(clat);
    float x = mercX(legend_lon) - cx;
    float y = mercY(legend_lat) - cy;
    fill(2, 12, 255, 200);
    textSize(20);
    
    // legend for blue outer circle
    stroke(0, 0, 123);
    strokeWeight(5);
    noFill();
    ellipse(x , y + 20, 15, 15);
    text("Homicide per 100k",x + 20, y + 27); 
    
    // legend for green inner circle
    noStroke();
    fill(55, 123, 55, 200);
    ellipse(x, y + 50, 20, 20);
    text("Guns per 100",x + 20, y + 57); 
  }
  int getVizualizationNum(){
    return vizualizationNum;
  }
  String getHeading(){
    return heading;
  }
  
  void setHeading(){
    // set co-ordinates on map where heading needs to be places.
    float cx = mercX(clon);
    float cy = mercY(clat);
    float x = mercX(heading_lon) - cx;
    float y = mercY(heading_lat) - cy;
    fill(2, 12, 255, 200);
    textSize(27);
    text(heading,x,y);
  }
  
  void showStatistics(Table inputData){
    // TODO
    
     // convert GDP to integer by creating a new variable
        for (TableRow row : inputData.rows()) {
            int GDP = row.getInt("GDP");
            row.setInt("iGDP",GDP);
        }
        
  }
}