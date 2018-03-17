class Top_10_countries_by_GDP extends Visualization{
  int vizualizationNum = 2;
  String heading = "Top 10 countries by GDP";
  Top_10_countries_by_GDP(){}
  void draw(Table inputData){
    
        //new integer value of GDP column
        inputData.addColumn("iGDP", Table.INT);
        
        // convert GDP to integer by creating a new variable
        for (TableRow row : inputData.rows()) {
            int GDP = row.getInt("GDP");
            row.setInt("iGDP",GDP);
        }
        
        // sort in desc order of GDP, pick top 10 for display
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
          //println(i);
          if(i < top) {
            String country = row.getString("Country");
            int GDP = row.getInt("iGDP");
            //println(GDP);
            
            // scaled GDP
            GDP_bar_size[i] = GDP / 300; // resize as required
            
            // X position relative to left spacem required width and space
            bar_position_x[i] = int(lb + (i + .5) * (w + s));
            bar_position_y[i] = ground_position - bb - GDP_bar_size[i]/2;
            flag[i] = loadImage(trim(country.substring(0,3)).toLowerCase() + ".png");
    
            // load image
            imageMode(CENTER);
            image(flag[i], bar_position_x[i], bar_position_y[i], w, GDP_bar_size[i]);
            
            // display data values
            fill(0);
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
       textSize(30);
       text("GDP in $ per capita according to International Monetary Fund",550,100);
    }
  int getVizualizationNum(){
    return vizualizationNum;
  }
  
  String getHeading(){
    return heading;
  }
}