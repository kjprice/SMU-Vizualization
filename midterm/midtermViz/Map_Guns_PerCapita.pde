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
            // Developed country 
            
            // convert lat and lon to x, y plot on graph
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
      }// end of check for developed country
    }
  }
  void showLegends(){
    // TODO
  }
  
  void showTop10GDP(Table inputData){
    inputData.addColumn("iGDP", Table.INT);
    
    // convert GDP to integer by creating a new variable
    for (TableRow row : inputData.rows()) {
        int GDP = row.getInt("GDP");
        row.setInt("iGDP",GDP);
    }
    
    // sort in desc order of GDP, pick top 5 for display
    inputData.sortReverse("iGDP");
    int i = 0; // loop counter
    int top = 10; // change this to increase or decrease # of countries
                  // make sure flag is present
    
    // each bar data
    // data to draw a bar
    int[] GDP_bar_size  = new int[top]; 
    int[] bar_position_x  = new int[top];
    int[] bar_position_y  = new int[top];
    int ground_position = 700;
    PImage[] flag  = new PImage[top];
    
    // chart level data
    // data to position all the bars
    int bb = 40;   // Bottom border
    int lb = 40;  // Left side border
    int w = 80;    // Width of bars
    int s = 20;    // Space between bars
    
    // loop thru sorted table
    for (TableRow row : inputData.rows()) {
      println(i);
      if(i < top) {
        String country = row.getString("Country");
        int GDP = row.getInt("iGDP");
        println(GDP);
        
        // scaled GDP
        GDP_bar_size[i] = GDP / 300; // resize as required
        
        // X position relative to left spacem required width and space
        bar_position_x[i] = int(lb + (i + .5) * (w + s));
        bar_position_y[i] = ground_position - bb - GDP_bar_size[i]/2;
        flag[i] = loadImage((country.substring(0,3)).toLowerCase() + ".png");

        // load image
        imageMode(CENTER);
        image(flag[i], bar_position_x[i], bar_position_y[i], w, GDP_bar_size[i]);
        
        // display data values
        textAlign(CENTER);
        textSize(13);
        text(GDP ,bar_position_x[i],bar_position_y[i] - (GDP_bar_size[i] / 2 )- (bb / 2));
        text(country, bar_position_x[i], ground_position - bb/2);
        
        // next bar
        i+=1;
      }
      else {
         break;
      }
    }
   }
}