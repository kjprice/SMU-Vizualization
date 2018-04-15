class Earth {
  private PImage flatEarthImage;
  private float diameter;

  Earth() {
    flatEarthImage = loadImage("Flat_earth.png");
  }
  
  void draw(float diameter) {
    this.diameter = diameter;
    this.drawFlatCircle(flatEarthImage);
  }
 
  void drawFlatCircle(PImage topImage) {
    beginShape();
    noStroke();
    texture(topImage);
    float radius = diameter / 2;
    vertex(-radius, -radius, 0, 0, 0);
    vertex(radius, -radius, 0, topImage.width, 0);
    vertex(radius, radius, 0, topImage.width, topImage.height);
    vertex(-radius, radius, 0, 0, topImage.height);
    endShape();
  }

  int getEarthImagePixelsWidth() {
    return this.flatEarthImage.width;
  }
}
