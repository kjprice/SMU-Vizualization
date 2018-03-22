class GNI_Homicide extends Visualization{
  int vizualizationNum = 3;
  String heading = "GNI, Homicide and guns";
  float RadiusOfcirle;
  float circleX;
  float circleY;
  float homicide;
  float suicide;
  float gni;
  String country;
  float guns;
  PImage gun=loadImage("gun.png");
  PImage blood=loadImage("blood.png");
  PImage gunMan = loadImage("gunMan.png");
  PImage murder = loadImage("murder.jpg");
  int sizeX;
  int sizeY;
  
  GNI_Homicide(){}
 

 
  void draw(Table inputData){
    strokeWeight(1);
    for (TableRow row : inputData.rows()) {
         String economy = trim(row.getString("Developed"));
         if (economy.equals("yes")==true){
             homicide = row.getFloat("Homicide per 100k");
             suicide = row.getFloat("Suicide per 100k");
             guns = row.getFloat("Guns per 100");
             gni = row.getFloat("gni2016");
             country = row.getString("Country");
             circleY = sq(height*0.8-gni/180-mouseY);
             RadiusOfcirle = sq(guns/2);
             if(homicide*200+10<=width){
               //get points within circle
               circleX = sq(homicide*200+10-mouseX);
               fill(243,197,10,150);
               ellipse(homicide*200+10,height*0.8-gni/180,guns,guns);
               inCircle(circleX, circleY, RadiusOfcirle, homicide, suicide, guns, country, gni);
             }
             else{
               fill(243,197,10,150);
               ellipse(width-guns/2,height*0.8-gni/180,guns,guns);
               circleX=sq(width-guns/2-mouseX);
               inCircle(circleX, circleY, RadiusOfcirle, homicide, suicide, guns, country, gni);
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
    text("GNI",25,25);
    text("Homicide per 100k",width-250,height*0.85);
    
   //legend
   fill(243,197,10,150);
   strokeWeight(1);
   ellipse(width-180,70,30,30);
   fill(0);
   textAlign(LEFT);
   textSize(20);
   text("Legend: ",width-220,40);
   textSize(15);
   text("Guns per 100 people",width-160,70);
   
   
   //picture
    sizeX=50;
    sizeY=100;
    pushMatrix();
    gunMan.resize(sizeX,sizeY);
    gun.resize(int(sizeX*1.2),sizeY/2);
    blood.resize(int(sizeX*1.5),int(sizeY/2*1.5));
    murder.resize(int(sizeX*1.5),int(sizeY/2*1.5));
    translate(width*0.35,height*0.254);
    imageMode(CENTER);
    image(gun, 0, 0);
    image(gunMan, 100, 0);
    image(murder, 200, 0);
    image(blood, 200, 0);
    fill(0);
    textAlign(LEFT);
    textSize(30);
    text("+1",-70,0);
    text("=",40,0);
    text("1.2% increase of homicides", 60,-60);
    textSize(15);
    text("per capita",-70,40);
    text("after human development index and gross national income", 70, 70);
    text("taken into account", 70, 100);
    popMatrix();
  }
  
  int getVizualizationNum(){
    return vizualizationNum;
  }
  
  String getHeading(){
    return heading;
  }
}