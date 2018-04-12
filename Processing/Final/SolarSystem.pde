/*
  Distance to sun is approximately 3k miles: https://wiki.tfes.org/Distance_to_the_Sun
  Diameter of Earth is approximately 25k miles: https://theflatearthsociety.org/tiki/tiki-index.php?page=Eratosthenes+on+Diameter
*/

public class SolarSystem {
  int EARTH_DIAMETER_MILES = 25000;
  float SUN_RATE_OF_ROTATION = 1.5; // Number of degrees changed per frame
  float MOON_RATE_OF_ROTATION = 1; // Number of degrees changed per frame
  // TODO: 1500 is arbitrary - see if we can find better numbers
  int SUN_ROTATION_RADIUS_MILES = 1850;
  float MILES_TO_PIXEL = 5;
  int MOON_ROTATION_RADIUS_MILES = 1400;

  // For animation purposes
  float currentXRotation = 0;
  float futureXRotation = 0;

  float currentTranslateZ = 300;
  float futureTranslateZ = 300;

  // our solar system objects
  CelestialObject sun;
  CelestialObject sunlight;
  Earth earth;
  CelestialObject moon;
 
  // number of miles that are comprised in every pixel
  float sunPositionTheta = TWO_PI;
  float moonPositionTheta = PI;
  boolean isOnEarth = false;

  SolarSystem() {
    earth = new Earth();
    // This must be calculated by taken the Earth image width (in pixels) and divide by the Earth's diameter in miles
    float distanceRatio = ((float)this.earth.getEarthImagePixelsWidth() / EARTH_DIAMETER_MILES);

    sun = new CelestialObject(5, SUN_RATE_OF_ROTATION, sunPositionTheta, distanceRatio, SUN_ROTATION_RADIUS_MILES, true,false);
    sun.enableLightSource();
    sunlight = new CelestialObject(25, SUN_RATE_OF_ROTATION, sunPositionTheta, distanceRatio, SUN_ROTATION_RADIUS_MILES, true,true);
    moon = new CelestialObject(5, MOON_RATE_OF_ROTATION, moonPositionTheta, distanceRatio, MOON_ROTATION_RADIUS_MILES, false,false);
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
  }

  // The order of each item is important due to lighting - the moon should not have ambient light but should have light casted upon it
  void drawCelestialBodies() {
    this.earth.draw();
    this.sun.iluminateOtherObjects();
    this.moon.draw();
    this.sun.draw();
    this.sunlight.draw();
    
  }

  void moveToEarth() {
    this.futureXRotation = 87;
    this.futureTranslateZ = 400;
    if (isOnEarth){
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