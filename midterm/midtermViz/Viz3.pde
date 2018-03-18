class Viz3 extends Visualization{
  int vizualizationNum = 3;
  String heading = "Viz3";
  float RadiusOfcirle;
  
  Viz3(){}
  
 
  void draw(Table inputData){
    //fill(255,60,30);
    //rect(0,0,width,height-400);
    //println(inputData.getColumnTitle(11));
    strokeWeight(1);
    for (TableRow row : inputData.rows()) {
         String economy = trim(row.getString("Developed"));
         if (economy.equals("yes")==true){
             float homicide = row.getFloat("Homicide per 100k");
             float suicide = row.getFloat("Suicide per 100k");
             float guns = row.getFloat("Guns per 100");
             float gdp = row.getFloat("GDP");
             //homicide + suicide, But suicide typically much more than homicide. So will try visualization without suicide
             //fill(155,155,30);
             //ellipse((homicide+suicide)*40,height*0.8-guns*6,guns,guns);
             ////suicide ellipse
             //fill(0);
             //ellipse((homicide+suicide)*40-guns/2-suicide/2,height*0.8-guns*6,suicide,suicide);
             ////homicide ellipse
             //fill(255,0,0);
             //ellipse((homicide+suicide)*40+guns/2+homicide/2,height*0.8-guns*6,homicide,homicide);
             if(homicide*200+10<=width){
               fill(0,180);
               ellipse(homicide*200+10,height*0.8-gdp/180,guns,guns);
               circleX = abs(width-guns/2-guns);
               circleY = abs(height*0.8-gdp/180-guns);
               RadiusOfcirle = guns;
               homicideC = homicide;
               inCircle(RadiusOfcirle, homicide, homicide*200+10+guns,height*0.8-gdp/180-guns);
                fill(255,0,0,50);
                //ellipse(homicide*200+10,height*0.8-gdp/180,suicide,suicide);
             }
             else{
               fill(0,180);
               ellipse(width-guns/2,height*0.8-gdp/180,guns,guns);
              // circleX = abs(width-guns/2-guns);
               //circleY = abs(height*0.8-gdp/180-guns);
               RadiusOfcirle = guns;
               fill(255,0,0,50);
              // ellipse(width-guns/2,height*0.8-gdp/180,suicide,suicide);
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
    text("Homicide per 100k",width-250,height*0.85);
    
  }
  
  void template(float homicide,float suicide,float guns){
    ellipse(homicide+suicide, guns, guns*10, guns*10);
  }
  int getVizualizationNum(){
    return vizualizationNum;
  }
  

  
  String getHeading(){
    return heading;
  }
}