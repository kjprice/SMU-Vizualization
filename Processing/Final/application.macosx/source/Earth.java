import processing.core.*;

class Earth {
  private PImage flatEarthImage;
  private float diameter;
  PApplet p;

  Earth(PApplet p) {
    this.p = p;
    flatEarthImage =p.loadImage("Flat_earth.png");
  }
  
  void draw(float diameter) {
    this.diameter = diameter;
    this.drawFlatCircle(flatEarthImage);
  }
 
  void drawFlatCircle(PImage topImage) {
   p.beginShape();
   p.noStroke();
   p.texture(topImage);
    float radius = diameter / 2;
   p.vertex(-radius, -radius, 0, 0, 0);
   p.vertex(radius, -radius, 0, topImage.width, 0);
   p.vertex(radius, radius, 0, topImage.width, topImage.height);
   p.vertex(-radius, radius, 0, 0, topImage.height);
   p.endShape();
  }

  int getEarthImagePixelsWidth() {
    return this.flatEarthImage.width;
  }
}
