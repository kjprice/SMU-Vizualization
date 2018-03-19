class GDP_Homicide extends Visualization{
  int vizualizationNum = 3;
  String heading = "GDP, Homicide and guns";
  float RadiusOfcirle;
  float circleX;
  float circleY;
  float homicide;
  float suicide;
  float gdp;
  String country;
  float guns;
  PImage gun=loadImage("gun.png");
  PImage murder=loadImage("murder.jpg");
  
  GDP_Homicide(){}
 

 
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
             RadiusOfcirle = sq(guns/2);
             if(homicide*200+10<=width){
               //get points within circle
               circleX = sq(homicide*200+10-mouseX);
               inCircle(circleX, circleY, RadiusOfcirle, homicide, suicide, guns, country, gdp);
               fill(243,197,10,150);
               ellipse(homicide*200+10,height*0.8-gdp/180,guns,guns);
             }
             else{
               fill(243,197,10,150);
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
    
   //legend
   fill(243,197,10,150);
   strokeWeight(1);
   ellipse(width-200,70,30,30);
   fill(0);
   textAlign(LEFT);
   textSize(20);
   text("Legend: ",width-220,40);
   textSize(15);
   text("Guns per 100 people",width-160,70);
   
   //picture
    
  }
  
  int getVizualizationNum(){
    return vizualizationNum;
  }
  
  String getHeading(){
    return heading;
  }
}