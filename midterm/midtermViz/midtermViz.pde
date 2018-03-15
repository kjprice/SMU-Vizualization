int clat = 0;
int clon = 0;
int zoom = 1;
Table table;
float i1=1;
float i2=0;
boolean change=false;
int offset = 100 ;
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
  dashboard.draw();   
  dashboard.drawViz();
  if (change == true){
    i2+=0.2;
    i1-=0.1;
    if(i2>=2){
       i2=2;
       change = false;
      }
    if(i1<=0){
        i1=0.0001;
        change = false;
         }
         
  }

}