/*
  Distance to sun is approximately 3k miles: https://wiki.tfes.org/Distance_to_the_Sun
  Diameter of Earth is approximately 25k miles: https://theflatearthsociety.org/tiki/tiki-index.php?page=Eratosthenes+on+Diameter
*/

public class SolarSystem {
  Distance distance = new Distance();

  int EARTH_DIAMETER_MILES = 25000;
  int SUN_DIAMETER_MILES = 500;
  int SUNLIGHT_DIAMETER_MILES = 800;
  int MOON_DIAMETER_MILES = 200;
  int DISTANCE_TO_SUN = 3000;
  float SUN_RATE_OF_ROTATION = 1.5; // Number of degrees changed per frame
  float MOON_RATE_OF_ROTATION = 1; // Number of degrees changed per frame
  // TODO: 1500 is arbitrary - see if we can find better numbers
  int SUN_ROTATION_RADIUS_MILES = 2450;
  float MILES_TO_PIXEL = 5;
  int MOON_ROTATION_RADIUS_MILES = 1400;
  int EYE_POSITION_START_MILES = -12000;

  // For animation purposes
  float currentXRotation = 0;
  float futureXRotation = 0;

  float currentTranslateZ = distance.getObjectScale(EYE_POSITION_START_MILES);
  float futureTranslateZ = currentTranslateZ;

  // our solar system objects
  CelestialObject sun;
  CelestialObject sunlight;
  Earth earth;
  CelestialObject moon;
 
  // number of miles that are comprised in every pixel
  float sunPositionTheta = TWO_PI;
  float moonPositionTheta = PI;
  boolean isOnEarth = false;
  Star[] stars = new Star[2000];

  SolarSystem() {
    earth = new Earth();
    sun = new CelestialObject(SUN_DIAMETER_MILES, SUN_RATE_OF_ROTATION, sunPositionTheta, SUN_ROTATION_RADIUS_MILES, true,false);
    sun.enableLightSource();
    sunlight = new CelestialObject(SUNLIGHT_DIAMETER_MILES, SUN_RATE_OF_ROTATION, sunPositionTheta, SUN_ROTATION_RADIUS_MILES, true,true);
    moon = new CelestialObject(MOON_DIAMETER_MILES, MOON_RATE_OF_ROTATION, moonPositionTheta, MOON_ROTATION_RADIUS_MILES, false,false);
    // plenty of stars
    for (int i = 0; i < stars.length; i++) {
        stars[i] = new Star();
     }
  }
 
  void draw() {
    background(0);
    // Oh the darkness of space
    fill(255);
    pushMatrix();
      translate(width/2, height/2, this.currentTranslateZ);
      rotateX(radians(this.currentXRotation));
      // scaleEverything();
      this.drawCelestialBodies();
    popMatrix();

    setCamera();

    this.animateTransitions();
    for (int i = 0; i < stars.length; i++) {
      stars[i].update();
      stars[i].show();
    }
  }

  // The order of each item is important due to lighting - the moon should not have ambient light but should have light casted upon it
  void drawCelestialBodies() {
    this.earth.draw(distance.getObjectScale(EARTH_DIAMETER_MILES));
    this.sun.iluminateOtherObjects(distance.getObjectScale(DISTANCE_TO_SUN));
    this.moon.draw(distance.getObjectScale(DISTANCE_TO_SUN));
    this.sun.draw(distance.getObjectScale(DISTANCE_TO_SUN));
    this.sunlight.draw(distance.getObjectScale(DISTANCE_TO_SUN)); // check if camera is on Earth
    
  }

  void moveToEarth() {
    this.isOnEarth = !this.isOnEarth;

    if (isOnEarth){
      this.futureXRotation = 87;
      this.futureTranslateZ = 400;
    } else {
       this.futureXRotation = 0;
       this.futureTranslateZ = 300;
    }
  }

  void animateTransitions() {
    this.animateXRotation();
    this.animateTranlationZ();
  }

  void animateTranlationZ() {
    if (this.currentTranslateZ == this.futureTranslateZ) {
      return;
    }
    if (this.isOnEarth) {
      this.currentTranslateZ++;
    }
    else {
      this.currentTranslateZ--;
    }
  }

  void animateXRotation() {
    if (this.currentXRotation == this.futureXRotation) {
      return;
    }
    if (this.isOnEarth) {
      this.currentXRotation++;
    }
    else {
       this.currentXRotation--;
    }
  }
 
  void scaleEverything() {
    float earthImageDesiredPixelWidth = this.EARTH_DIAMETER_MILES / this.MILES_TO_PIXEL;

    scale(earthImageDesiredPixelWidth);
  }
  
  void setCamera() {
    camera(width/2.0, height/2, (height/2.0) / tan(PI*30.0 / 180.0),
      width/2.0, height/2.0, 0,
      0, 1, 0);
  }
}
