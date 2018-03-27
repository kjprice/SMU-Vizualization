public class BarObject {
  
  float barWidth;
  int numberOfBars;
  int[] bar_size ; 
  int[] bar_position_x ;
  int[] bar_position_y ;
  int ground_position;
  PImage[] flag ;
  int bottom_border;
  int left_border;
  int width_of_bar;
  int space_between_bar;
  
  
   BarObject() {}
   BarObject(int barsToDisplay){
      numberOfBars = barsToDisplay;
      bar_size  = new int[numberOfBars];
      bar_position_x  = new int[numberOfBars];
      bar_position_y  = new int[numberOfBars];
      flag  = new PImage[numberOfBars];
      this.bottom_border = 40;   // Bottom border
      this.left_border = 40;  // Left side border
      this.width_of_bar = 70;    // Width of bars
      this.space_between_bar = 20;    // Space between bars
      this.ground_position = 600;
  }
  
  
}