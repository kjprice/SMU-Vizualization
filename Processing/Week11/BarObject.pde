public class BarObject {
  
  float barWidth;
  int numberOfBars;
  int[] bar_size ; 
  int[] bar_position_x ;
  int[] bar_position_y ;
  int ground_position = 600;
  PImage[] flag ;
  int bb = 40;   // Bottom border
  int lb = 40;  // Left side border
  int w = 70;    // Width of bars
  int s = 20;    // Space between bars
  
  
   BarObject() {}
   BarObject(int barsToDisplay){
      numberOfBars = barsToDisplay;
      bar_size  = new int[numberOfBars];
      bar_position_x  = new int[numberOfBars];
      bar_position_y  = new int[numberOfBars];
      flag  = new PImage[numberOfBars];
  }
  
  
}