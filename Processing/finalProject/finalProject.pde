World world;

void setup() {
  size(800, 600, P3D);
  world = new World();
}

void draw() {
  background(100);
  world.draw();
}
