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
      flag_position_y_table = verticalSpaceBetweenFlags * numberOfCountriesCreated;
      flag_position_y = height - height/10;
      curveFlagPositionY=flag_position_y;
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

  void display(){
    imageMode(CENTER);
    //draw flag in a left upper corner
    pushMatrix();
    translate(flag_position_x-flagWidth/2,flag_position_y_table);
    scale(0.5,0.5);
    image(img,0,0);
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
    //draw the curve of the score
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
    //fill(0);
    ////text of score
    //text("Mentioned",curveVertexX.get(i-1)+80,curveVertexY.get(i-1));
    //text(getCurrentScore(),curveVertexX.get(i-1)+140,curveVertexY.get(i-1));
    //if (getCurrentScore()<10){
    //   text("times",curveVertexX.get(i-1)+152,curveVertexY.get(i-1));
    //}
    //if (getCurrentScore()>=10&&getCurrentScore()<100){
    //   text("times",curveVertexX.get(i-1)+160,curveVertexY.get(i-1));
    //}
    //if (getCurrentScore()>=100&&getCurrentScore()<1000){
    //   text("times",curveVertexX.get(i-1)+168,curveVertexY.get(i-1));
    //}
    ////draw a small Flag image at curve points
    //for (int j=0; j<curveVertexX.size(); j++){
    //  pushMatrix();
    //  translate(curveVertexX.get(j) + flagWidth/2*0.15,curveVertexY.get(j));
    //  scale(0.15,0.15);
    //  image(img,0,0);
    //  popMatrix();
    //}
  }
}