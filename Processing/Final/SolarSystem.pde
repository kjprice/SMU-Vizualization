public class SolarSystem {
  Sun sun;
  Earth earth;

  SolarSystem() {
    sun = new Sun();
    earth = new Earth();
  }
 
  void draw() {
    this.earth.draw();
    this.sun.draw();
  }
}
