class Guns_Suicide extends Visualization{
  int vizualizationNum = 5;
  String heading = "Guns and suicide";
  float RadiusOfcirle;
  float circleX;
  float circleY;
  float homicide;
  float suicide;
  float gdp;
  String country;
  float guns;
  float sizeX;
  float sizeY;
  PImage gun=loadImage("gun.png");
  PImage suicideIm=loadImage("suicide.jpg");
  
  Guns_Suicide(){}
  
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
             circleY = sq(height*0.8-guns*5.5-mouseY);
           
             
              RadiusOfcirle = sq(gdp/4000);
             if(suicide*25+10<=width){
               //get points within circle
               circleX = sq(suicide*25+10-mouseX);
               inCircle(circleX, circleY, RadiusOfcirle, homicide, suicide, guns, country, gdp);
               fill(255,0,10,150);
               ellipse(suicide*25+10,height*0.8-guns*5.5,gdp/2000,gdp/2000);

             }
             else{
               circleX=sq(width-suicide-mouseX);
               inCircle(circleX, circleY, RadiusOfcirle, homicide, suicide, guns, country, gdp);
               fill(255,0,10,150);
               ellipse(height*0.8-guns*5.5,width-gdp/2000,gdp/2000,gdp/2000);
             }
         }
    }
    //legend
     fill(255,0,10,150);
     strokeWeight(1);
     ellipse(width-200,70,30,30);
     textAlign(LEFT);
     textSize(20);
     fill(0);
     text("Legend: ",width-220,40);
     textSize(15);
     text("GDP",width-160,70);
     text("Suicide doesn't appear to increase with increase of gun owenership", 200, 50);
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
    text("Suicide per 100k",width-250,height*0.85);
    //picture
    sizeX=50;
    sizeY=100;
    pushMatrix();
    gun.resize(int(sizeX*1.2),int(sizeY/2));
    suicideIm.resize(int(sizeX*1.5),int(sizeY/2*1.5));
    translate(width*0.67,height*0.254);
    imageMode(CENTER);
    image(gun, 0, 0);
    image(suicideIm, 150, 0);
    fill(0);
    textAlign(LEFT);
    textSize(30);
    text("+1",-70,0);
    text("=",40,0);
    textSize(15);
    text("increase of suicides", 60,-60);
    text("per capita",-70,40);
    line(40,5,60,-20);
    popMatrix();
   
  }
  int getVizualizationNum(){
    return vizualizationNum;
  }
  
  String getHeading(){
    return heading;
  }
}