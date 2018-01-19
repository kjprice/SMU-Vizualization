
// first define a bunch of images ( 1 kj, 10 eve, 10 gabe) all in grey scale
// Map through each eve and gabe image
PImage img;

void setup() {
  size(1000, 1000);
  // Images must be in the "data" directory to load correctly
  img = loadImage("kj.jpg");
}

void draw() {
  image(img, 10, 0);
}