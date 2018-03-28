class GDP_Homicide_2 extends Visualization{
  String heading = "GNI * Homicides per 100";
  Scatterplot scatterplot;
  
  GDP_Homicide_2(){}
  
  GDP_Homicide_2(Table inputData){
    scatterplot = new Scatterplot(inputData, "gni2016", "Homicide per 100k");
  }

  void draw(Table inputData){
    scatterplot.draw();
  }
  
  String getHeading(){
    return heading;
  }
}
