// images sources credited to https://mario.nintendo.com/

PImage marioStand;
PImage marioRun;
PImage marioJump;

boolean rightArrowPressed = false;
boolean leftArrowPressed = false;

float characterVelocityX = 1;
float characterVelocityY = 0;
float characterAcceleration = 0;

void performJump() {
  if (characterVelocityY == 0) {
    characterAcceleration = characterHeight * 4;
  }
}

void setupCharacter() {
  loadCharacterImages();
}

void loadCharacterImages() {
  marioStand = loadImage("images/mario-stand.png");
  marioRun = loadImage("images/mario-run.png");
  marioJump = loadImage("images/mario-jump.png");
}

PImage getImageByAction() {
  // based on if we are running, jumping, etc
  
  return marioStand;
}

void calculateCharacterVelocity() {
  if (leftArrowPressed) {
    characterVelocityX -= characterRunningSpeed;
  } else if (rightArrowPressed) {
    characterVelocityX += characterRunningSpeed;
  } else {
    characterVelocityX = 0;
  }
}

void calculateCharacterPosition() {
  characterRunningSpeed = (width / 10) / frameRate;
  calculateCharacterVelocity();

  characterPositionX += characterVelocityX;
  characterPositionY += characterVelocityY;
}

void drawCharacter() {
  PImage currentImage = getImageByAction();
  float characterWidth = ((float)currentImage.width / (float)currentImage.height) * characterHeight; 
  image(currentImage, characterPositionX, characterPositionY, characterWidth, characterHeight);
}