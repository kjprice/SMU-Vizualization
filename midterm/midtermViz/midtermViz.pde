int clat = 0;
int clon = 0;
int zoom = 1;
String heading = "Gun availability Per Capita of Country ";
Table table;

int button_start_x = 20;
int button_start_y = 720;
int offset = 100 ;
int button_w = 80;
int button_h = 50;
MapGunsPerCapita mapData;

void setup() {
  size(1100, 800);
  table = loadTable("GunViolenceClean.csv", "header");
  mapData = new MapGunsPerCapita();
}

void draw(){
  background(180);
  displayButtons();   
  mapData.showMapPerCapita(table);
}