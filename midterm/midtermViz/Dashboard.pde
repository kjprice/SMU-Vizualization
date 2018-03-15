class Dashboard extends DashboardPage{
  private int NUMBER_OF_BUTTONS = 5;
  private int button_start_x;
  private int button_start_y;
  private int button_w = 80;
  private int button_h = 50;
  private String heading;
  private int lastVizualization = 0;
  private int chosenVizualization = 1;
  private int buttonClicked;
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
    for (int i = 0; i < NUMBER_OF_BUTTONS; i++) {
      drawButton(start_x);
      start_x = start_x + offset;
    }
   int start_y = button_start_y;
   for (int j=0; j<vizNum; j++){
      if (buttonClicked==viz[j].getVizualizationNum()){
        println("button clicked", buttonClicked);
        println("viz num", viz[j].getVizualizationNum());
         heading=viz[j].getHeading();
         println(heading);
        textAlign(LEFT);
        textSize(25);
        text(heading,start_x + 20,start_y+30);
      }
    }


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
          buttonClicked = i;
          //heading = i + "";
          //this variables for listing visualizations
          i1=1;
          i2=0;

          // TODO set dashboardPage
          
      
    }
        start_x += offset;
    }
  }
  
  void drawViz(){
     println("chosen",chosenVizualization);
     println("last",lastVizualization);
     if (lastVizualization==0){
         viz[0].draw(table);
         }
     for (int j=0; j<vizNum; j++){
       if(lastVizualization!=0){
         if(viz[j].getVizualizationNum() == lastVizualization){
              for (int k=0; k<vizNum; k++){
                 if(viz[k].getVizualizationNum() == chosenVizualization){
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
}