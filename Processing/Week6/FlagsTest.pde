

Country c1,c2;
PImage img;

void setupFlags() {
  c1 = new Country("US.GIF");
  c1.setFlagPositions(10,10);
  c2 = new Country("RS.png");
  c2.setFlagPositions(10,40);
}

void drawFlags() {
  // Displaying one image
  c1.move();
  c2.move();
  c1.display();
  c2.display();
  updateInformation();
}

void updateInformation(){
  // just to test
  
  for(int i =0; i< 1000; i++){
    if(i<900){
      c1.setSpeed(3,1);
      c2.setSpeed(0.1,1);
    }
    else {
      c1.setSpeed(0.1,1);
      c2.setSpeed(0.5,1);
    }
  }
  
}