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
MapGunsPerCapita mapData ;
void setup() {
  size(1100, 800);
  table = loadTable("GunViolenceClean.csv", "header");
  button_start_x = 20;
  button_start_y = 720;
  offset = 100 ;
  button_w = 80;
  button_h = 50;
 mapData = new MapGunsPerCapita();
}

void draw(){
  //background(0);
 displayButtons();   
 mapData.showMapPerCapita(table);

}


void displayButtons(){
  fill(25);
  noStroke();
  // buttons
  int start_x = button_start_x;
  int start_y = button_start_y;
  rect(start_x, start_y, button_w, button_h);
  start_x = start_x + offset;
  rect(start_x, start_y, button_w, button_h);
  start_x = start_x + offset;
  rect(start_x, start_y, button_w, button_h);
  start_x = start_x + offset;
  rect(start_x, start_y, button_w, button_h);
  start_x = start_x + offset;
  rect(start_x, start_y, button_w, button_h);
  start_x = start_x + offset;
  textAlign(LEFT);
  textSize(25);
  //fill(0);
  text(heading,start_x + 20,start_y+30);
 
}

void mouseClicked() {
  
    println("Mouse clicked");
    println(mouseX, mouseY,button_start_x,button_start_x+button_w, button_start_y,button_start_y+button_h);
    // first button  
    if (
        mouseX >= button_start_x && 
        mouseX <= button_start_x+button_w && 
        mouseY >= button_start_y && 
        mouseY <= button_start_y+button_h
      ) {
        heading = "Gun availability Per Capita of Country ";
        println("first button");
        
      }
    if (
        mouseX >= button_start_x + offset && 
        mouseX <= button_start_x +offset +button_w && 
        mouseY >= button_start_y && 
        mouseY <= button_start_y+button_h
      ) {
        
        heading = " How do i reset the heading??? :( ";
        println("2nd button");
        
      }
    
  
}