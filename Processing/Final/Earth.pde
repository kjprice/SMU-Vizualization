class Earth {
  private PImage flatEarthImage;

  Earth() {
    flatEarthImage = loadImage("Flat_earth.png");
  }
  
  void draw() {
    this.drawFlatCircle(flatEarthImage);
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
