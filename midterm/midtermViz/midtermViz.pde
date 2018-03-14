int clat = 0;
int clon = 0;
int zoom = 1;
Table table;

int offset = 100 ;
//MapGunsPerCapita mapData;
Dashboard dashboard;

void setup() {
  size(1100, 800);
  dashboard = new Dashboard();
  table = loadTable("GunViolenceClean.csv", "header");
  //mapData = new MapGunsPerCapita();
}

float i1=1;
float i2=0;//.0001;



void draw(){
  background(180);
  dashboard.draw();   
  dashboard.drawViz();
  pushMatrix();
  translate(0,0);
  scale(i1,1);
  rotate(i2);
 // mapData.draw(table);
  popMatrix();
  i2+=0.2;
  if(i2>=2){
    i2=2;
  }
  i1-=0.4;
  if(i1<=0){
    i1=0.0001;
  }

  //pushMatrix();
  //translate(0,0);
  //scale(i1,1);
  //mapData.draw(table);
  //popMatrix();
  //i1-=0.1;
  //if(i1<=0){
  //  i1=0.0001;
  //}
}