// scatterplot of gun ownership versus homicides (grouped by develop[ed|ing] countries)

class RegressionVisualization extends Visualization{
  float DEVELOPED_NATION_CUTOFF = 12476;
  int vizualizationNum = 4;
  String heading = "Log(Homicides) * Guns per 100";
  Scatterplot scatterplot;
  
  RegressionVisualization(){}
  void setup(Table inputData) {
    // TODO: somehow color scatterplot points based on GDP
    // TODO: create regression plot
    float[][] xyz = calculateValues(inputData);
    float[] x = xyz[0];
    float[] y = xyz[1];
    float[] z = xyz[2];
    scatterplot = new Scatterplot(x, y, z);
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
  
  private float[][] calculateValues(Table inputData) {
    float [] x = new float [inputData.getRowCount()];
    float [] y = new float [inputData.getRowCount()];
    float [] z = new float [inputData.getRowCount()];
    int i = 0;
    for (TableRow row : inputData.rows()) {
      x[i] = row.getFloat("Guns per 100");
      y[i] = log(row.getFloat("Homicide per 100k"));
      z[i] = row.getFloat("gni2016");
      i++;
    }
    
    return new float[][] {x, y, z};
  }
}