class Viz4 extends Visualization{
  int vizualizationNum = 4;
  String heading = "Viz4";
  Scatterplot scatterplot;

  Viz4(){}
  void setup(Table inputData) {
    scatterplot = new Scatterplot(inputData);
  }
  void draw(Table inputData){
    if (this.scatterplot == null) {
      this.setup(inputData);
    }
    scatterplot.draw();
  }
  int getVizualizationNum(){
    return vizualizationNum;
  }
  String getHeading(){
    return heading;
  }
}