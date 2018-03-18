class Viz3 extends Visualization{
  int vizualizationNum = 3;
  String heading = "Viz3";
  float RadiusOfcirle;
  float circleX;
  float circleY;
  float homicide;
  float suicide;
  float gdp;
  String country;
  float guns;
  
  Viz3(){}
  
 
  void draw(Table inputData){
    //fill(255,60,30);
    //rect(0,0,width,height-400);
    //println(inputData.getColumnTitle(11));
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
             RadiusOfcirle = sq(guns/2);
             if(homicide*200+10<=width){
               //get points within circle
               circleX = sq(homicide*200+10-mouseX);
               inCircle(circleX, circleY, RadiusOfcirle, homicide, suicide, guns, country, gdp);
               fill(255,120,150,150);
               ellipse(homicide*200+10,height*0.8-gdp/180,guns,guns);
             }
             else{
               fill(255,120,150,150);
               ellipse(width-guns/2,height*0.8-gdp/180,guns,guns);
               circleX=sq(width-guns/2-mouseX);
               inCircle(circleX, circleY, RadiusOfcirle, homicide, suicide, guns, country, gdp);
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
  
  void inCircle(float circleX, float circleY, float RadiusOfcirle, float homicide, float suicide, float guns, String country, float gdp){
    int offset=20;
    if(circleX+circleY<=RadiusOfcirle){
         if(homicide*200+10<=width-200){
           if(height*0.8-gdp/180>25){
              fill(128,0,64);
              textAlign(LEFT);
              textSize(12);
              text(country,homicide*200+10+guns,height*0.8-gdp/180-guns);
              text("Homicide per 100k "+homicide,homicide*200+10+guns,height*0.8-gdp/180-guns+offset);
              text("Suicide per 100k "+suicide,homicide*200+10+guns,height*0.8-gdp/180-guns-20+offset*3);
              text("Guns per 100 people "+guns,homicide*200+10+guns,height*0.8-gdp/180-guns-20+offset*4);
              text("GDP per capita "+gdp,homicide*200+10+guns,height*0.8-gdp/180-guns-20+offset*5);
           }
           else{
              fill(128,0,64);
              textAlign(LEFT);
              textSize(12);
              text(country,homicide*200+10-guns*2,offset);
              text("Homicide per 100k "+homicide,homicide*200+10-guns*2,offset*2);
              text("Suicide per 100k "+suicide,homicide*200+10-guns*2,offset*3);
              text("Guns per 100 people "+guns,homicide*200+10-guns*2,offset*4);
              text("GDP per capita "+gdp,homicide*200+10-guns*2,offset*5);
             
           }
         }
         else{
           if(height*0.8-gdp/180>25){
              fill(128,0,64);
              textAlign(LEFT);
              textSize(12);
              text(country,width-300,height*0.8-gdp/180-guns);
              text("Homicide per 100k "+homicide,width-300,height*0.8-gdp/180-guns+offset);
              text("Suicide per 100k "+suicide,width-300,height*0.8-gdp/180-guns-20+offset*3);
              text("Guns per 100 people "+guns,width-300,height*0.8-gdp/180-guns-20+offset*4);
              text("GDP per capita "+gdp,width-300,height*0.8-gdp/180-guns-20+offset*5);
           }
           else{
              fill(128,0,64);
              textAlign(LEFT);
              textSize(12);
              text(country,width-300,offset);
              text("Homicide per 100k "+homicide,width-300,offset*2);
              text("Suicide per 100k "+suicide,width-300,offset*3);
              text("Guns per 100 people "+guns,width-300,offset*4);
              text("GDP per capita "+gdp,width-300,offset*5);
            }
         }
       }
  }
  
  String getHeading(){
    return heading;
  }
}