class Dashboard{
  private int NUMBER_OF_BUTTONS = 5;
  private int button_start_x;
  private int button_start_y;
  private int button_w = 132;//80
  private int button_h = 100;//50
  private String heading;
  private int lastVizualization = 1;
  private int chosenVizualization = 0;
  private boolean change=false;
  private int offset = 150;
  private float scaleAngle=1;
  private float rotationAngle=0;
  private float animationSpeed = .08;
  Table table;

  public Visualization[] viz;
  boolean flagInd = true;

  Dashboard(Table inputData) {
    this.table = inputData;
  }
  
  void setup() {
    button_start_x = 20;
    button_start_y = 720;

    viz = new Visualization[] {
      //new MapGunsPerCapita(),
      new Top_10_countries_by_GDP(),
      new Top_10_countries_by_GDP(flagInd),
      new GNI_Homicide(),
      new GDP_Homicide_2(this.table),
      new Guns_Suicide()
    };
  }
  
  void draw() {
    this.drawViz();
    this.drawButtons();
    this.drawHeader();
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
    for (int j=0; j < this.viz.length; j++){
      viz[j].prerender(table);
      background(180);
    }
  }
  
  void drawButton(int buttonNumber) {
    int x = button_start_x + (this.offset * buttonNumber);
    int y = button_start_y;

    pushMatrix();
    translate(x, y);
    scale(0.12, 0.12);
    viz[buttonNumber].draw(table);
    popMatrix();
  }
  
  void drawHeader() {
    heading=viz[chosenVizualization].getHeading();
    fill(230,70,30);
    textAlign(LEFT);
    textSize(20);
    text(heading, button_start_x + (this.offset * NUMBER_OF_BUTTONS), button_start_y + 30);
  }
    
  void drawButtons(){
    fill(25);
    noStroke();
    for (int i = 0; i < NUMBER_OF_BUTTONS; i++) {
      this.drawButton(i);
    }
  }
  
  public int getHeight() {
    return this.button_h;
  }
  
  void setNewVisualization(int vizNumber) {
    lastVizualization = chosenVizualization;
    chosenVizualization = vizNumber;
    scaleAngle = 1;
    rotationAngle = 0;
    change = true;
  }
  
  void checkButtonsClicked() {
    for(int i = 0; i <= this.viz.length; i++) {
      int x = button_start_x + (offset * i);
      if (
          mouseX >= x && 
          mouseX <= x + button_w && 
          mouseY >= button_start_y && 
          mouseY <= button_start_y + button_h
        ) {
          if (i == chosenVizualization) {
            // do not restart animation if we are on the same vizualization
            return;
          }
          this.setNewVisualization(i);
      }
    }
  }
  
  void drawViz(){
    Visualization thisViz = viz[chosenVizualization];
    thisViz.draw(table);
    if (change) {
      drawAnimatedVizualization();
    }
  }
  
  void drawAnimatedVizualization() {
    Visualization lastViz = viz[lastVizualization];
    //list flipping of last visualization
    pushMatrix();
    translate(0,0);
    scale(scaleAngle,1);
    rotate(rotationAngle);
    lastViz.draw(table);
    popMatrix();
  }
}