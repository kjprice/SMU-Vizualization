// scatterplot of gun ownership versus homicides (grouped by develop[ed|ing] countries)

class GDP_Homicide_2 extends Visualization{
  int vizualizationNum = 4;
  String heading = "GNI * Homicides per 100";
  Scatterplot scatterplot;
  
  GDP_Homicide_2(){}
  
  GDP_Homicide_2(Table inputData){
    scatterplot = new Scatterplot(inputData, "gni2016", "Homicide per 100k");
  }

  void draw(Table inputData){
    scatterplot.draw();
  }
  
  int getVizualizationNum(){
    return vizualizationNum;
  }
  String getHeading(){
    return heading;
  }
  
}
