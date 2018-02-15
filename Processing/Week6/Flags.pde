

Country[] countries;

PImage img;

void setupFlags() {
  Country usa = new Country("US.GIF", new String[]{"usa"});
  usa.setFlagPositions(10,10);
  Country rsu = new Country("RS.png", new String[]{"rsu"});
  rsu.setFlagPositions(10,40);
  
  countries = new Country[]{
    usa,
    rsu
  };
}

void drawFlags() {
  background(200);
  for (int i = 0; i < countries.length; i++) {
    Country country = countries[i];
    country.move();
    country.display();
    updateInformation(country);
  }
}

void updateInformation(Country country){
  // just to test
  
  for(int i =0; i< 1000; i++){
    if(i<900){
      country.setSpeed(3,1);
    }
    else {
      country.setSpeed(0.1,1);
    }
  }
  
}