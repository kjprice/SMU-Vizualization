PImage selectedImage;
float imagePositionX;
float imagePositionY;

void loadImageToFix() {
  selectedImage = loadImage("tattoo.jpeg");
  imagePositionX = 0;
  imagePositionY = 0;
}
void drawImage() {
  image(selectedImage, imagePositionX, imagePositionY);
}