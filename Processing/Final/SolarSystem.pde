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

  Sun sun;
  Earth earth;
  Moon moon;
  // number of miles that are comprised in every pixel
  float sunPositionTheta = TWO_PI;
  float moonPositionTheta = PI;
  boolean isOnEarth = false;
  
  SolarSystem() {
    sun = new Sun();
    earth = new Earth();
    moon = new Moon();
  }
 
  void draw() {
    background(100);

    pushMatrix();
    translate(width/2, height/2, this.currentTranslateZ);
    rotateX(radians(currentXRotation));
    // scaleEverything();
    this.earth.draw();
    this.drawSun();
    this.rotateSun();
    this.drawMoon();
    this.rotateMoon();
    popMatrix();

    setCamera();

    this.animateTransitions();
  }

  void moveToEarth() {
    this.futureXRotation = 87;
    this.futureTranslateZ = 400;
    isOnEarth = true;
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

  void drawSun() {
    // find how far the sun spins from its axis based on ratios found from the earth
    float sunDistanceMultiplier = ((float)this.earth.getEarthImagePixelsWidth() / EARTH_DIAMETER_MILES) * SUN_ROTATION_RADIUS_MILES;
    float x = cos(sunPositionTheta) * sunDistanceMultiplier;
    float y = sin(sunPositionTheta) * sunDistanceMultiplier;
    this.sun.draw(x, y);
  }
  
  void drawMoon() {
    // find how far the moon spins from its axis based on ratios found from the earth
    float moonDistanceMultiplier = ((float)this.earth.getEarthImagePixelsWidth() / EARTH_DIAMETER_MILES) * MOON_ROTATION_RADIUS_MILES;
    float x = cos(moonPositionTheta) * moonDistanceMultiplier;
    float y = sin(moonPositionTheta) * moonDistanceMultiplier;
    this.moon.draw(x, y);
  }
  
  void rotateSun() {
    sunPositionTheta += TWO_PI * SUN_RATE_OF_ROTATION / 360;
  }

  void rotateMoon() {
    moonPositionTheta += TWO_PI * MOON_RATE_OF_ROTATION / 360;
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
