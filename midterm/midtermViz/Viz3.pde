class Viz3 extends Visualization{
  int vizualizationNum = 3;
  String heading = "Viz3";
  Viz3(){}
  void draw(Table inputData){
    fill(255,60,30);
    rect(0,0,width,height-400);
  }
  int getVizualizationNum(){
    return vizualizationNum;
  }
  
  String getHeading(){
    return heading;
  }
}