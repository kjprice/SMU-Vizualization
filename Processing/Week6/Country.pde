class Country{
  PImage img;
  String flag;
  int position;
  int currentScore;
  String[] countryNames;
  float flag_position_x, flag_position_y; // location
  float xspeed, yspeed; // speed
  
  Country(String flagFilePath, String[] countryNames){
    img = loadImage(flagFilePath);
    this.countryNames = countryNames;
    img.resize(15,10);
  }
  
  void setFlagPositions(float x,float y){
      flag_position_x= x;
      flag_position_y = y;
  }
  
  void setSpeed(float x,float y){
    xspeed = x; 
    yspeed = y;
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
  void setCurrentScore(int score){
    currentScore = score;
  }
  
  PImage showFlag(){
    return img;
  }
  
  void move() {
    flag_position_x += xspeed; // Increment x
    // y += yspeed; // Increment y
  }
  
  String[] getNames() {
    return this.countryNames;
  }
  
  void display(){
    stroke(0);
    imageMode(CENTER);
    image(img,flag_position_x,flag_position_y);
  }
}