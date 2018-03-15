int clat = 0;
int clon = 0;
int zoom = 1;
Table table;

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
  mapData.showMapPerCapita(table);
}