class Viz5 extends Visualization{
  int vizualizationNum = 5;
  String heading = "Guns, GDP and homicide+suicide";
  float RadiusOfcirle;
  float circleX;
  float circleY;
  float homicide;
  float suicide;
  float gdp;
  String country;
  float guns;
  
  Viz5(){}
  
  void draw(Table inputData){
    strokeWeight(1);
    for (TableRow row : inputData.rows()) {
         String economy = trim(row.getString("Developed"));
         if (economy.equals("yes")==true){
             homicide = row.getFloat("Homicide per 100k");
             suicide = row.getFloat("Suicide per 100k");
             guns = row.getFloat("Guns per 100");
             gdp = row.getFloat("GDP");
             country = row.getString("Country");
             circleY = sq(height*0.8-gdp/180-mouseY);
             if (homicide>suicide){
                RadiusOfcirle = sq(homicide/2);
             }
             else{
               RadiusOfcirle = sq(suicide/2);
             }
             if(guns*10+10<=width){
               //get points within circle
               circleX = sq(guns*10+10-mouseX);
               inCircle(circleX, circleY, RadiusOfcirle, homicide, suicide, guns, country, gdp);
               fill(243,197,10,150);
               ellipse(guns*10+10,height*0.8-gdp/180,homicide,homicide);
               fill(0,150);
               ellipse(guns*10+10,height*0.8-gdp/180,suicide,suicide);
             }
             else{
               circleX=sq(width-guns/2-mouseX);
               inCircle(circleX, circleY, RadiusOfcirle, homicide, suicide, guns, country, gdp);
               fill(243,197,10,150);
               ellipse(width-guns/2,height*0.8-gdp/180,homicide,homicide);
               fill(0,150);
               ellipse(guns*10+10,height*0.8-gdp/180,suicide,suicide);
             }
         }
    }
    //coordinates
    stroke(0);
    strokeWeight(2);
   line(10,height*0.8,10,0);
   line(10,height*0.8,width,height*0.8);
   //arrows x
   line(width,height*0.8,width-width/50,height*0.79);
   line(width,height*0.8,width-width/50,height*0.81);
   //arrows y
   line(10,0, width/65, 0+height*0.03);
   line(10,0, width/250, 0+height*0.03);
   //text
   fill(0);
    textAlign(LEFT);
    textSize(20);
    text("GDP",25,25);
    text("Guns",width-250,height*0.85);
    
  }
  int getVizualizationNum(){
    return vizualizationNum;
  }
  
  String getHeading(){
    return heading;
  }
}