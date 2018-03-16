int clat = 0;
int clon = 0;
int zoom = 1;
Table table;
float i1=1;
float i2=0;
boolean change=false;
int offset = 150 ;
MapGunsPerCapita mapData;
Dashboard dashboard;

void setup() {
  size(1100, 800);
  table = loadTable("GunViolenceClean.csv", "header");
  mapData = new MapGunsPerCapita();
  dashboard = new Dashboard();
}

void draw(){
  background(180);
  dashboard.drawViz();
  dashboard.draw();
  if (change == true){
    i2+=0.2;
    i1-=0.3;
    if(i2>=1.7){
     i2=1.7;
     change = false;
    }
    if(i1<=0){
      i1=0.0001;
      change = false;
     }
  }
}