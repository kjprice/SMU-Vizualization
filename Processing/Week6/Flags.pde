

Country[] countries;

PImage img;
PImage snow;

void setupFlags() {
  Country germany      = new Country("deu.png", new String[]{"#deu", "germany", "deutsche"});
  Country netherlands  = new Country("nld.png", new String[]{"#nld", "netherlands", "nederland"});
  Country norway       = new Country("nor.png", new String[]{"#nor", "norway", "norge"});
  Country canada       = new Country("can.png", new String[]{"#can", "canada"});
  Country usa          = new Country("usa.gif", new String[]{"#usa", "america", "u.s.a"});
  
  countries = new Country[]{
    usa,
    germany,
    netherlands,
    norway,
    canada
  };
}

void drawFlags() {
  snow=loadImage("snow.jpg");
  snow.resize(1500,800);
  background(snow);
  for (int i = 0; i < countries.length; i++) {
    Country country = countries[i];
      if(i==0){
         stroke(0);
       }
      if(i==1){
         stroke(11,1,186);
       }
      if(i==2){
         stroke(255,0,128);
       }
      if(i==3){
         stroke(255,0,0);
       }
       if(i==4){
         stroke(118,1,19);
       }
    country.display();
  }
}