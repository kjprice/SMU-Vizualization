abstract class Visualization{
  Table inputData;
  Visualization(){}
  abstract void draw(Table inputData);
  abstract int getVizualizationNum();
  abstract String getHeading();
  
  void inCircle(float RadiusOfcirle, float homicide, float x, float y){//float suicide, float guns, float gdp, 
  //get information
  if(mouseX+mouseY<=RadiusOfcirle){
      textAlign(LEFT);
      textSize(12);
      text(homicide,x,y);    
   }
  }
}