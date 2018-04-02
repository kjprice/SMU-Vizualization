/*
  Distance to sun is approximately 3k miles: https://wiki.tfes.org/Distance_to_the_Sun
  Diameter of Earth is approximately 25k miles: https://theflatearthsociety.org/tiki/tiki-index.php?page=Eratosthenes+on+Diameter
*/

public class SolarSystem {
  int EARTH_DIAMETER_MILES = 25000;
  Sun sun;
  Earth earth;
  // number of miles that are comprised in every pixel
  float MILES_TO_PIXEL = 5;

  SolarSystem() {
    sun = new Sun();
    earth = new Earth();
  }
 
  void draw() {
    background(100);
    translate(width/2, height/2, 0);
    scaleEverything();

    this.earth.draw();
    this.sun.draw();

    this.setCamera();
  }

  void scaleEverything() {
    int earthImageDesiredPixelWidth = ceil(this.EARTH_DIAMETER_MILES / this.MILES_TO_PIXEL);

    scale(earthImageDesiredPixelWidth);
  }

  void setCamera() {
    camera(width/2.0, height/2.0, 100,
      width/2.0, height/2.0, 20,
      0, 1, 0);
  }

  // TODO: We should include the current width of the earth image when calculaating the new width
  void calculateMilesToPixelConversion() {
    int earthPixelsCount = this.earth.getEarthImagePixelsWidth();
  }
}
