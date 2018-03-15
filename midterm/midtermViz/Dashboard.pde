int vizToDisplay = 1;

class Dashboard {
  private int NUMBER_OF_BUTTONS = 5;
  private int button_start_x;
  private int button_start_y;
  private int button_w = 80;
  private int button_h = 50;
  private String heading = "Gun availability Per Capita of Country ";

  Dashboard() {
    this.setup();
  }
  
  void setup() {
    button_start_x = 20;
    button_start_y = 720;
  }
  
  void setupDashboardPages() {
    // TODO
  }
  
  void draw() {
    this.displayButtons();
  }

  void drawButton(int startX) {
    int start_y = button_start_y;
    rect(startX, start_y, button_w, button_h);
  }
  
  void drawDashboardPage() {
    // TODO
  }
    
  void displayButtons(){
    fill(25);
    noStroke();
    int start_x = button_start_x;
    int start_y = button_start_y;
    for (int i = 0; i < NUMBER_OF_BUTTONS; i++) {
      drawButton(start_x);
      start_x = start_x + offset;
    }
    textAlign(LEFT);
    textSize(25);
    text(heading,start_x + 20,start_y+30);
  }
  
  void checkButtonsClicked() {
    int start_x = button_start_x;
    for(int i = 0; i < NUMBER_OF_BUTTONS; i++) {
            if (
                mouseX >= start_x && 
                mouseX <= start_x+button_w && 
                mouseY >= button_start_y && 
                mouseY <= button_start_y+button_h
              ) {
                  heading = "Gun availability Per Capita of developed Countries ";
                  //heading = i + "";
                  vizToDisplay = 1;
                  println("first button");
                  // TODO set dashboardPage
              }
            // Preeti added below set of code for rest of buttons
            else if (
              mouseX >= button_start_x + offset && 
              mouseX <= button_start_x +offset +button_w && 
              mouseY >= button_start_y && 
              mouseY <= button_start_y+button_h
            ) {
                  heading = " Top 10 countries by GDP ";
                  vizToDisplay = 2;
                  println("2nd button");
            }
            else if (
              mouseX >= button_start_x + (offset *2) && 
              mouseX <= button_start_x + (offset *2) +button_w && 
              mouseY >= button_start_y && 
              mouseY <= button_start_y+button_h
            ) {
                  heading = " What comes here? ";
                  vizToDisplay = 3;
                  println("3nd button");
            }
            else if (
              mouseX >= button_start_x + (offset *3) && 
              mouseX <= button_start_x + (offset *3) +button_w && 
              mouseY >= button_start_y && 
              mouseY <= button_start_y+button_h
            ) {
                  heading = " 4th viz ";
                  vizToDisplay = 4;
                  println("4th button");
            }
            else if (
              mouseX >= button_start_x + (offset *4) && 
              mouseX <= button_start_x + (offset *4) +button_w && 
              mouseY >= button_start_y && 
              mouseY <= button_start_y+button_h
            ) {
                  heading = " 5th Viz ";
                  vizToDisplay = 5;
                  println("5th button");
            }
    
     start_x += offset;
    }
  }
}