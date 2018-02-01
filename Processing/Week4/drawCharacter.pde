// images sources credited to https://mario.nintendo.com/

PImage marioStand;
PImage marioRun;
PImage marioJump;

void loadCharacterImages() {
  marioStand = loadImage("images/mario-stand.png");
  marioRun = loadImage("images/mario-run.png");
  marioJump = loadImage("images/mario-jump.png");
}

PImage getImageByAction() {
  // based on if we are running, jumping, etc
  
  return marioStand;
}

void drawCharacter() {
  PImage currentImage = getImageByAction();
  float characterWidth = ((float)currentImage.width / (float)currentImage.height) * characterHeight; 
  image(currentImage, characterPositionX, characterPositionY, characterWidth, characterHeight);
}