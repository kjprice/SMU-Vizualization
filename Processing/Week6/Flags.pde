

Country[] countries;

PImage img;

void setupFlags() {
  Country usa          = new Country("usa.gif", new String[]{"#usa", "america", "u.s.a"});
  Country germany      = new Country("deu.png", new String[]{"#deu", "germany", "deutsche"});
  Country netherlands  = new Country("nld.png", new String[]{"#nld", "netherlands", "nederland"});
  Country norway       = new Country("nor.png", new String[]{"#nor", "norway", "norge"});
  Country canada       = new Country("can.png", new String[]{"#can", "canada"});
  
  countries = new Country[]{
    usa,
    germany,
    netherlands,
    norway,
    canada
  };
}

void drawFlags() {
  background(200);
  for (int i = 0; i < countries.length; i++) {
    Country country = countries[i];
    country.display();
  }
}