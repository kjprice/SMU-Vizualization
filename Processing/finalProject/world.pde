public class World {
  PImage flatEarthImage;

  World() {
    flatEarthImage = loadImage("Flat_earth.png");
  }
 
  void draw() {
    this.drawMap();
  }
  
  void drawMap() {
    image(flatEarthImage, 0, 0);
  }
 
  // draw map (
  // draw sun
}
