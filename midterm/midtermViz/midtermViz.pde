int clat = 0;
int clon = 0;
int zoom = 1;
Table table;
float scaleAngle=1;
float rotationAngle=0;
boolean change=false;
int offset = 150 ;
Dashboard dashboard;



void setup() {
  size(1100, 800);
  //table = loadTable("GunViolenceClean.csv", "header");
  table = loadTable("newData.csv", "header");
  dashboard = new Dashboard();
}

void draw(){
  if (frameCount == 1) {
    dashboard.prerender();
  }
  background(180);
  dashboard.drawViz();
  dashboard.draw();
  if (change == true){
    rotationAngle+=0.2;
    scaleAngle-=0.3;
    if(rotationAngle>=1.7){
     rotationAngle=1.7;
     change = false;
    }
    if(scaleAngle<=0){
      scaleAngle=0.0001;
      change = false;
     }
  }


}