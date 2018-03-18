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
             circleY = sq(height*0.8-guns*6-mouseY);
           
             
              RadiusOfcirle = sq(gdp/4000);
             //if(homicide>suicide){
             //   RadiusOfcirle = sq(homicide);
             //}
             //else{
             //  RadiusOfcirle = sq(suicide);
             //}
             if((homicide+suicide)*25+10<=width){
               //get points within circle
               circleX = sq((homicide+suicide)*25+10-mouseX);
               inCircle(circleX, circleY, RadiusOfcirle, homicide, suicide, guns, country, gdp);
               fill(255,0,10,150);
               ellipse((homicide+suicide)*25+10,height*0.8-guns*6,gdp/2000,gdp/2000);
               //ellipse((homicide+suicide)*25+10,height*0.8-guns*6,homicide*2,homicide*2);
               //fill(0,150);
               //ellipse((homicide+suicide)*25+10,height*0.8-guns*6,suicide*2,suicide*2);
             }
             else{
               circleX=sq(width-suicide-mouseX);
               inCircle(circleX, circleY, RadiusOfcirle, homicide, suicide, guns, country, gdp);
               fill(255,0,10,150);
               ellipse(width-gdp/2000,height*0.8-guns*6,gdp/2000,gdp/2000);
               //ellipse(width-homicide,height*0.8-guns*6,homicide*2,homicide*2);
               //fill(0,150);
              // ellipse(width-suicide,height*0.8-guns*6,suicide*2,suicide*2);
             }
         }
    }
    //legend
     fill(255,0,10,150);
     strokeWeight(1);
     ellipse(width-200,70,30,30);
     textAlign(LEFT);
     textSize(20);
     text("Legend: ",width-220,40);
     textSize(15);
     text("GDP",width-160,70);
   //fill(0,150);
   //strokeWeight(1);
   //ellipse(width-200,70,30,30);
   //fill(255,0,10,150);
   //ellipse(width-200,110,30,30);
   //fill(0);
   //textAlign(LEFT);
   //textSize(20);
   //text("Legend: ",width-220,40);
   //textSize(15);
   //text("Suicides",width-160,70);
   //text("Homicides",width-160,110);

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
    text("Guns per 100",25,25);
    text("Homicide and Suicide per 100k combined",width-450,height*0.85);
    
  }
  int getVizualizationNum(){
    return vizualizationNum;
  }
  
  String getHeading(){
    return heading;
  }
}