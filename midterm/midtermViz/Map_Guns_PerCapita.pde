public class MapGunsPerCapita extends DashboardPage {
  int ww = 1000;
  int hh = 700;
  PImage mapimg;
  
  MapGunsPerCapita() {
    super("Guns Per Capita", "Gun availability Per Capita of Country");
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

  void showMapPerCapita(Table inputData){
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
      float GunsPerCapita = row.getFloat("Guns.Per.Capita");
      String country = row.getString("Country");
      // I want to use this value to add a thick stroke width for circle for developed. 
      // not working
      String economy = trim(row.getString("Developed"));
      int stroke_W = 1;
      if (economy.equals("Yes") == true) {
          stroke_W = 5;
      }
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
    }
  }
  void showLegends(){
    // TODO
  }
}