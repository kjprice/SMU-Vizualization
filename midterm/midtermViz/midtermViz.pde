int clat = 0;
int clon = 0;
int zoom = 1;
String heading = "";
Table table;

int vizToDisplay;
MapGunsPerCapita mapData;

void setup() {
  size(1100, 800);
  table = loadTable("GunViolenceClean.csv", "header");
  mapData = new MapGunsPerCapita();
}

void draw(){
  background(180);
  displayButtons();   
  switch(vizToDisplay) {
      case 1: 
        mapData.showMapPerCapita(table);
        println("showMapPerCapita");  
        break;
      case 2: 
        mapData.showTop10GDP(table);
        println("showTop5GDP");
        break;
      default:             
        println("None");
        break;
    }
 
}