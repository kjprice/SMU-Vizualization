class Country{
  PImage img;
  String flag;
  int position;
  int currentScore;
  String[] countryNames;
  float flag_position_x, flag_position_y; // location
  
  Country(String flagFilePath, String[] countryNames){
    img = loadImage(flagFilePath);
    this.countryNames = countryNames;
    this.setCountryNamesToLowerCase();
    img.resize(15,10);
  }
  
  private void setCountryNamesToLowerCase() {
    for (int i = 0; i < this.countryNames.length; i++) {
      this.countryNames[i] = this.countryNames[i].toLowerCase();
    }
  }
  
  void setFlagPositions(float x,float y){
      flag_position_x= x;
      flag_position_y = y;
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
  
  PImage showFlag(){
    return img;
  }
  
  void receiveMentionFromTwitter() {
    this.currentScore++;
    this.flag_position_x += flagSpeed; // Increment x
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