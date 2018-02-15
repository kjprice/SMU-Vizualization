

Country[] countries;

PImage img;

void setupFlags() {
  // TODO: Setup countries:  - Germany - Netherlands - Norway - USA - Canada
  // TOOD: Setup multiple names per country (use abbreviate, full english name, and native spelling)
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
    country.display();
  }
}