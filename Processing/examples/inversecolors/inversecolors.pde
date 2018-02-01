PImage img;

void setup() {
  img = loadImage("pacman.jpeg");
}

void draw() {
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      int loc = x + y * img.width;
      color pixelColor = img.pixels[loc];
      float r = red(pixelColor);
      float g = green(pixelColor);
      float b = blue(pixelColor);
      float a = alpha(pixelColor);
      
      println(r, inverseColor(r));
      break;
      
    }
  }
  image(img, 0, 0);
}

float inverseColor(float c) {
  return c - 255;
}