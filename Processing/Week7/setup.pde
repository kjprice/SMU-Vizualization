//time of tweets gathering
void textOfTime(){
  strokeWeight(1);
  fill(0);
  textSize(18);
  text("in",750,80);
  text(sw.hour(),800,80);
  text("hours", 840,80);
  text(sw.minute(),900,80);
  text("minutes", 940,80);
}

Country[] countries;
PImage img;


float flagSpeed;
float verticalSpaceBetweenFlags;
float flagsXStartingPosition;

int flagWidth;
int flagHeight;

  
void setupFlags() {

  // Setup flag defaults
  flagSpeed = width / 60;
  flagWidth = int(width / 10);
  flagHeight = int(flagWidth * 0.5);
  verticalSpaceBetweenFlags = flagHeight/3.5;
  flagsXStartingPosition = width / 40 + flagWidth/2;
  
  Country canada       = new Country("can.png", new String[]{"#can", "canada", "канада"});
  Country usa          = new Country("usa.gif", new String[]{"#usa", "america", "u.s.a", "сша"});
  Country germany      = new Country("deu.png", new String[]{"#deu", "germany", "deutsche","Deutschland", "германия"});
  Country netherlands  = new Country("nld.png", new String[]{"#nld", "netherlands", "nederland", "нидерланды"});
  Country norway       = new Country("nor.png", new String[]{"#nor", "norway", "norge", "норвегия"});

  
  countries = new Country[]{
    usa,
    germany,
    netherlands,
    norway,
    canada
  };
}

void olympicRings(){
  //olimpyc rings
  noFill();
  strokeWeight(5);
  stroke(8,133,194);
  ellipse(1300,50,50,50);
  stroke(0);
  ellipse(1360,50,50,50);
  stroke(237,51,78);
  ellipse(1420,50,50,50);
  stroke(251,177,50);
  ellipse(1330,75,50,50);
  stroke(28,139,60);
  ellipse(1390,75,50,50);
}