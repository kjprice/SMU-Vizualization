class Viz5 extends Visualization{
  int vizualizationNum = 4;
  Viz5(){}
  void draw(Table inputData){
    fill(65,240,30);
    rect(0,0,width,height-400);
  }
  int getVizualizationNum(){
    return vizualizationNum;
  }
}