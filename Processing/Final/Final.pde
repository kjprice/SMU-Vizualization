SolarSystem solarSystem;

void setup() {
  size(800, 600, P3D);
  solarSystem = new SolarSystem();
}

void draw() {
  background(100);
  translate(width/2, height/2, 0);
  scale(3);
  solarSystem.draw();
}
