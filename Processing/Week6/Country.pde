int numberOfCountriesCreated = 0;

class Country{
  PImage img;
  String flag;
  int position;
  int currentScore;
  String[] countryNames;
  float flag_position_x, flag_position_y, flag_position_y_table; // location
  IntList curveVertexX = new IntList();
  IntList curveVertexY = new IntList();
  int previousScore;
  int thisScore;
  int changeScore;
  float curveFlagPositionY;
  float flag_position_x_table;
  
  Country(String flagFilePath, String[] countryNames){
    numberOfCountriesCreated++;
    this.countryNames = countryNames;
    this.setCountryNamesToLowerCase();
    this.setFlagPositions();
    this.curveVertexX.append(0);
    this.curveVertexY.append(int(flag_position_y));
    img = loadImage(flagFilePath);
    img.resize(flagWidth, flagHeight);
  }
  
  private void setCountryNamesToLowerCase() {
    for (int i = 0; i < this.countryNames.length; i++) {
      this.countryNames[i] = this.countryNames[i].toLowerCase();
    }
  }
  
  void setFlagPositions(){
      flag_position_x =  flagsXStartingPosition;
    if(numberOfCountriesCreated%2!=0){
      flag_position_x_table =  flagsXStartingPosition;
    }
    else{
      flag_position_x_table =  flagsXStartingPosition+400;
    }
      flag_position_y_table = verticalSpaceBetweenFlags * numberOfCountriesCreated;
      //flag_position_y = height - height/10;
      flag_position_y = 200 + 100 * numberOfCountriesCreated;
      curveFlagPositionY=flag_position_y;
  }
  
  //draws line below the score line
  void zeroScore(){
    strokeWeight(1);
    line(0,curveFlagPositionY,width,curveFlagPositionY);
  }
  
  PImage getFlag() {
    return img;
  }
  int getPosition(){
    return position;
  }
  
  void setPosition(int pos){
    position = pos;
  }
  
  int getCurrentScore(){
    return currentScore;
  }
  
  IntList getCurveVertexX(){
    return curveVertexX;
  }
  
  IntList getCurveVertexY(){
    return curveVertexY;
  }
  
  PImage showFlag(){
    return img;
  }
  
  void receiveMentionFromTwitter() {
    this.currentScore++;
  }
  
  String[] getNames() {
    return this.countryNames;
  }
  
  //draw flag table in a left upper corner
  void drawFlagTable(){
    pushMatrix();
    translate(flag_position_x_table-flagWidth/2,flag_position_y_table);
    scale(0.5,0.5);
    image(img,0,0);
    popMatrix();
  }
   //draw text for score to the table
  void drawTextFotFlagTable(){
    pushMatrix();
    translate(flag_position_x_table-flagWidth/2,flag_position_y_table);
    scale(0.5,0.5);
    //text of score
    fill(0);
    textSize(32);
    text("Mentioned",+80,0);
    text(getCurrentScore(),+260,0);
    if (getCurrentScore()<10){
       text("times",300,0);
    }
    if (getCurrentScore()>=10&&getCurrentScore()<100){
       text("times",+340,0);
    }
    if (getCurrentScore()>=100&&getCurrentScore()<1000){
       text("times",380,0);
    }
    popMatrix();
  }
  
  //time of tweets gathering
  void textOfTime(){
    strokeWeight(1);
    fill(0);
    textSize(18);
    text("in",750,80);
    text(currentHour-startHour,800,80);
    text("hours", 840,80);
    text(abs(currentMinute-startMinute),900,80);
    text("minutes", 940,80);
  }
  
  //draw the curve of the score
  void curvePath(){
    strokeWeight(3);
    noFill();
    beginShape();
    curveVertex(curveVertexX.get(0),curveVertexY.get(0));
    int i;
    for (i=0; i<curveVertexX.size(); i++){
      curveVertex(curveVertexX.get(i),curveVertexY.get(i));
    }
    curveVertex(curveVertexX.get(i-1),curveVertexY.get(i-1));
    endShape();
    pushMatrix();
    translate(curveVertexX.get(i-1) + flagWidth/2*0.3,curveVertexY.get(i-1));
    scale(0.3,0.3);
    image(img,0,0);
    popMatrix();
  }
  
  void display(){
    imageMode(CENTER);
    zeroScore();
    drawFlagTable();
    drawTextFotFlagTable();
    curvePath();
    textOfTime();
  }
}