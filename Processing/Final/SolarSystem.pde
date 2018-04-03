/*
  Distance to sun is approximately 3k miles: https://wiki.tfes.org/Distance_to_the_Sun
  Diameter of Earth is approximately 25k miles: https://theflatearthsociety.org/tiki/tiki-index.php?page=Eratosthenes+on+Diameter
*/

public class SolarSystem {
  int EARTH_DIAMETER_MILES = 25000;
  int SUN_RATE_OF_ROTATION = 1; // Number of degrees changed per frame
  // TODO: 1500 is arbitrary - see if we can find better numbers
  int SUN_ROTATION_RADIUS_MILES = 1500;
  float MILES_TO_PIXEL = 5;

  Sun sun;
  Earth earth;
  // number of miles that are comprised in every pixel
  float sunPositionTheta = TWO_PI;

  SolarSystem() {
    sun = new Sun();
    earth = new Earth();
  }
 
  void draw() {
    background(100);
    translate(width/2, height/2, 300);
    // scaleEverything();

    this.earth.draw();
    this.drawSun();
    this.rotateSun();

    this.setCamera();
  }

  void drawSun() {
    // find how far the sun spins from its axis based on ratios found from the earth
    float sunDistanceMultiplier = ((float)this.earth.getEarthImagePixelsWidth() / EARTH_DIAMETER_MILES) * SUN_ROTATION_RADIUS_MILES;
    float x = cos(sunPositionTheta) * sunDistanceMultiplier;
    float y = sin(sunPositionTheta) * sunDistanceMultiplier;
    this.sun.draw(x, y);
  }

  void rotateSun() {
    sunPositionTheta += TWO_PI * SUN_RATE_OF_ROTATION / 360;
  }

  void scaleEverything() {
    float earthImageDesiredPixelWidth = this.EARTH_DIAMETER_MILES / this.MILES_TO_PIXEL;

    scale(earthImageDesiredPixelWidth);
  }

  void setCamera() {
    camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0),
      width/2.0, height/2, 0,
      0, 1, 0);
  }
}
