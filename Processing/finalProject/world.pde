public class World {
  PImage flatEarthImage;

  World() {
    flatEarthImage = loadImage("Flat_earth.png");
  }
 
  void draw() {
    this.drawMap();
    this.drawSun();
  }
  
  void drawMap() {
    this.drawFlatCircle(flatEarthImage);
  }
 
  void drawSun() {
    spotLight(51, 102, 126, frameCount/3, 20, 40, -1, 0, 0, PI/2, 200);
    pushMatrix();
    translate(frameCount/3, 20, 40);
    ambientLight(255, 204, 0);
    sphere(10);
    popMatrix();
  }
  
  void drawFlatCircle(PImage topImage) {
    beginShape();
    noStroke();
    texture(topImage);
    vertex(-100, -100, 0, 0, 0);
    vertex(100, -100, 0, topImage.width, 0);
    vertex(100, 100, 0, topImage.width, topImage.height);
    vertex(-100, 100, 0, 0, topImage.height);
    endShape();
  }
}
