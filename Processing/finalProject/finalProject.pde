World world;

void setup() {
  // TODO: Setup global distance system (turn miles into pixels so that we can scale, translate, etc proportionately) - sun diameter, earth diameter, distance between earth and sun
  // TODO: have sun rotate around earth
  // TODO: turn flat-earth into a coordinate system somehow
  // TODO: Pick a point to have camera live (use coordinates of like, New York)
  size(800, 600, P3D);
  world = new World();
}

void draw() {
  background(100);
  translate(width/2, height/2, 0);
  scale(3);
  world.draw();
}
