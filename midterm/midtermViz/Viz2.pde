class Viz2 extends Visualization{
  int vizualizationNum = 1;
  Viz2(){}
  void draw(Table inputData){
    fill(155,20,130);
    rect(0,0,width,height-400);
  }
  int getVizualizationNum(){
    return vizualizationNum;
  }
}