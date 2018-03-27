class GunViolenceBarObject extends BarObject {
  
  
  
  GunViolenceBarObject(){
  }
  
  GunViolenceBarObject(int numberOfBars){
    super(numberOfBars);
  }
  
  private Table createNumericGDP(Table gunViolenceData){
    //new integer value of GDP column
        gunViolenceData.addColumn("iGDP", Table.INT);
        
        // convert GDP to integer by creating a new variable
        for (TableRow row : gunViolenceData.rows()) {
            int GDP = row.getInt("GDP");
            row.setInt("iGDP",GDP);
        }
        
        // sort in desc order of GDP, pick top 10 for display
        gunViolenceData.sortReverse("iGDP");
     return  gunViolenceData;
  }
  
  
  void drawBar(Table gunViolenceData){
        
        gunViolenceData = createNumericGDP(gunViolenceData);
        int i = 0; // loop counter
        
        // loop thru sorted table
        for (TableRow row : gunViolenceData.rows()) {
          if(i < numberOfBars) {
            String country = row.getString("Country");
            int GDP = row.getInt("iGDP");
            
            // scaled GDP
            bar_size[i] = GDP / 300; // resize as required
            
            // X position relative to left spacem required width and space
            bar_position_x[i] = int(left_border + (i + .5) * (width_of_bar + space_between_bar));
            bar_position_y[i] = ground_position - bottom_border - bar_size[i]/2;
            flag[i] = loadImage(trim(country.substring(0,3)).toLowerCase() + ".png");
    
            // load image
            imageMode(CENTER);
            image(flag[i], bar_position_x[i], bar_position_y[i], width_of_bar, bar_size[i]);
            
            // display data values
            fill(0);
            textAlign(CENTER);
            textSize(13);
            text(GDP ,bar_position_x[i],bar_position_y[i] - (bar_size[i] / 2 )- (bottom_border / 2));
            text(country, bar_position_x[i], ground_position - bottom_border/2);
            
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
  
  void drawBar(Table gunViolenceData, int barColour){
        
        gunViolenceData = createNumericGDP(gunViolenceData);
        
        int i = 0; // loop counter
        
        // loop thru sorted table
        for (TableRow row : gunViolenceData.rows()) {
          if(i < numberOfBars) {
            String country = row.getString("Country");
            int GDP = row.getInt("iGDP");
            
            // scaled GDP
            bar_size[i] = GDP / 300; // resize as required
            
            // X position relative to left spacem required width and space
            bar_position_x[i] = int(left_border + (i + .5) * (width_of_bar + space_between_bar));
            bar_position_y[i] = ground_position - bottom_border - bar_size[i]/2;
//            flag[i] = loadImage(trim(country.substring(0,3)).toLowerCase() + ".png");
    
            strokeWeight(4);
            rectMode(CENTER);  // Set rectMode to CENTER
            fill(barColour); 
            // fill(55, 123, 55, 200);
            rect(bar_position_x[i], bar_position_y[i], width_of_bar, bar_size[i]);
            
            // display data values
            fill(0);
            textAlign(CENTER);
            textSize(13);
            text(GDP ,bar_position_x[i],bar_position_y[i] - (bar_size[i] / 2 )- (bottom_border / 2));
            text(country, bar_position_x[i], ground_position - bottom_border/2);
            
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
}