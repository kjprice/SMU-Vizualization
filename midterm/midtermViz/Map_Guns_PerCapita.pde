public class MapGunsPerCapita extends Visualization {
  private int clat = 0;
  private int clon = 0;
  private int zoom = 1;
  int vizualizationNum = 1;
  PImage mapimg=loadImage("earth.jpg");
  PImage vizImage; // the rendered/cached version of this visual
  String heading = "Guns-homicide per capita of developed countries ";
  float lat;
  float lon;
  float GunsPerCapita;
  float homicide;
  float suicide;
  float gdp;
  String country;
  float circleX;
  float circleY;
  float RadiusOfcirle;
  
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


  void draw(Table inputData) {
    pushMatrix();
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
      lat = row.getFloat("latitude");
      lon = row.getFloat("longitude");
      GunsPerCapita = row.getFloat("Guns per 100");
      country = row.getString("Country");
      homicide = row.getFloat("Homicide per 100k");
      gdp = row.getFloat("GDP");
      int stroke_W = round(homicide);
      //filter out non-developed countries 
      String economy = trim(row.getString("Developed"));
            
      // display data of developed country only
      if (economy.equals("yes") == true) {

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
          
          circleX = sq(x+ww / 2 - mouseX);
          circleY = sq(y+hh / 2 - mouseY);
          RadiusOfcirle = sq(d/2);
          pushMatrix();
          translate(-ww / 2, -hh / 2);
          inCircle(circleX, circleY, RadiusOfcirle, homicide, suicide, GunsPerCapita,country,gdp);
          popMatrix();
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