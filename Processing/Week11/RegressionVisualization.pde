// scatterplot of gun ownership versus homicides (grouped by develop[ed|ing] countries)

class RegressionVisualization extends Visualization{
  float DEVELOPED_NATION_CUTOFF = 12476;
  int vizualizationNum = 4;
  String heading = "Log(Homicides) * Guns per 100";
  Scatterplot scatterplot;
  
  RegressionVisualization(){}
  void setup(Table inputData) {
    scatterplot = new Scatterplot(inputData, "Guns per 100", "Homicide per 100k", "gni2016");
    scatterplot.groupByZGreaterThan(DEVELOPED_NATION_CUTOFF);
  }
  void draw(Table inputData){
    if (this.scatterplot == null) {
      this.setup(inputData);
    }
    scatterplot.draw();
    scatterplot.showRegressionLines();
  }
  
  void drawRegressionLines() {
  }
      
  int getVizualizationNum(){
    return vizualizationNum;
  }
  String getHeading(){
    return heading;
  }
  
}
