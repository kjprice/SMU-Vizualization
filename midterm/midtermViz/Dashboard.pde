class Dashboard{
  private int NUMBER_OF_BUTTONS = 5;
  private int button_start_x;
  private int button_start_y;
  private int button_w = 132;//80
  private int button_h = 100;//50
  private String heading;
  private int lastVizualization = 0;
  private int chosenVizualization = 1;
  private int buttonClicked;
  private boolean change=false;
  private int offset = 150;
  private float scaleAngle=1;
  private float rotationAngle=0;
  private float animationSpeed = .1;
  Table table;

  public Visualization[] viz;

  MapGunsPerCapita v1;
  Top_10_countries_by_GDP v2;
  GDP_Homicide v3;
  Viz4 v4;
  Viz5 v5;
  public int vizNum = 5;//number of visualizations


  Dashboard(Table inputData) {
    this.table = inputData;
    this.setup();
  }
  
  void setup() {
    button_start_x = 20;
    button_start_y = 720;
    //number of created visualizations
    viz = new Visualization[vizNum];
    //class instances of each visualization.
    v1 = new MapGunsPerCapita();
    v2 = new Top_10_countries_by_GDP();
    v3 = new GDP_Homicide();
    v4 = new Viz4();
    v5 = new Viz5();
    //populate array with visualizations
    viz[0]=v1;
    viz[1]=v2;
    viz[2]=v3;
    viz[3]=v4;
    viz[4]=v5;
  }
  
  void draw() {
    this.drawViz();
    this.displayButtons();
    this.performAnimationPageChange();
  }
  
  void performAnimationPageChange() {
    if (change == true){
      rotationAngle += animationSpeed;
      scaleAngle -= animationSpeed;
      if (rotationAngle >= 1.7){
       rotationAngle=1.7;
       change = false;
      }
      if (scaleAngle <= 0){
        scaleAngle=0.0001;
        change = false;
       }
    }
  }

  void prerender() {
    for (int j=0; j < vizNum; j++){
      viz[j].prerender(table);
      background(180);
    }
  }
    
  void displayButtons(){
    fill(25);
    noStroke();
    int start_x = button_start_x;
    int start_y = button_start_y;
    for (int i = 0; i < NUMBER_OF_BUTTONS; i++) {
      for (int j=0; j<vizNum; j++){
        if (viz[j].getVizualizationNum()==i+1){
          pushMatrix();
          translate(start_x, start_y);
          scale(0.12,0.12);
          viz[j].draw(table);
          popMatrix();
        }
      }
      //drawButton(start_x);
      start_x = start_x + this.offset;
    }
   for (int j=0; j<vizNum; j++){
      if (buttonClicked==viz[j].getVizualizationNum()){
        heading=viz[j].getHeading();
        fill(230,70,30);
        textAlign(LEFT);
        textSize(20);
        text(heading,start_x,start_y+30);
      }
    }


  }
  
  public int getHeight() {
    return this.button_h;
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
          scaleAngle=1;
          rotationAngle=0;
    }
        start_x += offset;
    }
  }
  
  void drawViz(){
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
          scale(scaleAngle,1);
          rotate(rotationAngle);
          viz[j].draw(table);
          popMatrix();
        }
      }
    }     
  }
}