class Viz4 extends Visualization{
  int vizualizationNum = 4;
  String heading = "Viz4";
  Viz4(){}
  void draw(Table inputData){
    fill(5,120,190);
    rect(0,0,width,height-400);
  }
  int getVizualizationNum(){
    return vizualizationNum;
  }
  String getHeading(){
    return heading;
  }
}