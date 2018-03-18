abstract class Visualization{
  Table inputData;
  Visualization(){}
  abstract void draw(Table inputData);
  abstract int getVizualizationNum();
  abstract String getHeading();
  
}