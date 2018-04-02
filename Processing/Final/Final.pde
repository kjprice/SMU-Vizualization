SolarSystem solarSystem;

void setup() {
  size(800, 600, P3D);
  solarSystem = new SolarSystem();
}

void draw() {
  solarSystem.draw();
}
