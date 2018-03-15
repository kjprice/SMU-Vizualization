class Dashboard extends DashboardPage{
  private int NUMBER_OF_BUTTONS = 5;
  private int button_start_x;
  private int button_start_y;
  private int button_w = 80;
  private int button_h = 50;
  private String heading = "Gun availability Per Capita of Country ";
  private int lastVizualization = 1;
  private int chosenVizualization = 1;
  private Visualization[] viz;
  MapGunsPerCapita mapData;
  Viz2 v2;
  Viz3 v3;
  Viz4 v4;
  Viz5 v5;
  int vizNum = 5;//number of visualizations


  Dashboard() {
    this.setup();
  }
  
  void setup() {
    button_start_x = 20;
    button_start_y = 720;
    //number of created visualizations
    viz = new Visualization[vizNum];
    //class instances of each visualization.
    mapData = new MapGunsPerCapita();
    v2 = new Viz2();
    v3 = new Viz3();
    v4 = new Viz4();
    v5 = new Viz5();
    //populate array with visualizations
    viz[0]=mapData;
    viz[1]=v2;
    viz[2]=v3;
    viz[3]=v4;
    viz[4]=v5;
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
    //for (int j=0; j<vizNum; j++){
    //  pushMatrix();
    //  translate(startX, start_y);
    //  scale(-0.2,
    //  viz[j].draw(table);
    //  popMatrix();
    //}
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
    for(int i = 1; i <= NUMBER_OF_BUTTONS; i++) {
      if (
          mouseX >= start_x && 
          mouseX <= start_x+button_w && 
          mouseY >= button_start_y && 
          mouseY <= button_start_y+button_h
        ) {
          lastVizualization = chosenVizualization;
          chosenVizualization=i;

          //println(chosenVizualization);
          heading = "Gun availability Per Capita of Country ";
          heading = i + "";
          //println("first button");
          i1=1;
          i2=0;
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
                  // needs to be updated. is not showing viz2
                  //lastVizualization = chosenVizualization;
                  //chosenVizualization=i;
                  
                  i1=2;
                  i2=1;
                  // TODO set dashboardPage
            }
            else if (
              mouseX >= button_start_x + (offset *2) && 
              mouseX <= button_start_x + (offset *2) +button_w && 
              mouseY >= button_start_y && 
              mouseY <= button_start_y+button_h
            ) {
                  heading = " What comes here? ";
                  lastVizualization = chosenVizualization;
                  chosenVizualization=i;
                  //heading = i + "";
                  //println("first button");
                  i1=1;
                  i2=0;
                  // TODO set dashboardPage
                  println("3nd button");
            }
            else if (
              mouseX >= button_start_x + (offset *3) && 
              mouseX <= button_start_x + (offset *3) +button_w && 
              mouseY >= button_start_y && 
              mouseY <= button_start_y+button_h
            ) {
                  heading = " 4th viz ";
                  lastVizualization = chosenVizualization;
                  chosenVizualization=i;
                  //heading = i + "";
                  //println("first button");
                  i1=1;
                  i2=0;
                  // TODO set dashboardPage
                  println("4th button");
            }
            else if (
              mouseX >= button_start_x + (offset *4) && 
              mouseX <= button_start_x + (offset *4) +button_w && 
              mouseY >= button_start_y && 
              mouseY <= button_start_y+button_h
            ) {
                  heading = " 5th Viz ";
                  lastVizualization = chosenVizualization;
                  chosenVizualization=i;
                  //heading = i + "";
                  //println("first button");
                  i1=1;
                  i2=0;
                  // TODO set dashboardPage
                  println("5th button");
            }
        
        
        start_x += offset;
    }
  }
  
  void drawViz(){
     println("chosen",chosenVizualization);
     println("last",lastVizualization);
     for (int j=0; j<vizNum; j++){
       if(viz[j].getVizualizationNum() + 1 == lastVizualization){
            for (int k=0; k<vizNum; k++){
               if(viz[k].getVizualizationNum() + 1 == chosenVizualization){
                 viz[k].draw(table);
               }
             }
             change = true;
             //list flipping of last visualization
             pushMatrix();
             translate(0,0);
             scale(i1,1);
             rotate(i2);
             viz[j].draw(table);
             popMatrix();
         }
     }     
  }
}