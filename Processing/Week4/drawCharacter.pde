// images sources credited to https://mario.nintendo.com/

PImage marioStand;
PImage marioRun;
PImage marioJump;

boolean rightArrowPressed = false;
boolean leftArrowPressed = false;

float characterVelocityX = 1;
float characterVelocityY = 0;
float characterAcceleration = 0;

float characterWidth;
float maxCharacterWidth = 0;

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
  // check collision detection again just in case
  performCharacterCollisionDetection();
  // based on if we are running, jumping, etc
  if (characterVelocityY != 0) {
    return marioJump;
  }
  if (characterVelocityX != 0) {
    return marioRun;
  }
  return marioStand;
}

void calculateCharacterVelocity() {
  if (leftArrowPressed) {
    characterVelocityX = -characterRunningSpeed;
  } else if (rightArrowPressed) {
    characterVelocityX = +characterRunningSpeed;
  } else {
    characterVelocityX = 0;
  }
}

boolean characterTooFarLeft() {
   return characterPositionX < 0;
}

boolean characterTooFarRight() {
   return characterPositionX + maxCharacterWidth > width;
}

void performCharacterCollisionDetection() {
  if (characterTooFarLeft()) {
    characterPositionX = 0;
    characterVelocityX = 0;
  }
  if (characterTooFarRight()) {
    characterPositionX = width - maxCharacterWidth;
    characterVelocityX = 0;
  }
}

void calculateCharacterPosition() {
  characterRunningSpeed = (width / 2) / frameRate;
  calculateCharacterVelocity();
  performCharacterCollisionDetection();

  characterPositionX += characterVelocityX;
  characterPositionY += characterVelocityY;
}

void drawCharacter() {
  PImage currentImage = getImageByAction();
  characterWidth = ((float)currentImage.width / (float)currentImage.height) * characterHeight;
  image(currentImage, characterPositionX, characterPositionY, characterWidth, characterHeight);
  
  if (characterWidth > maxCharacterWidth) {
    maxCharacterWidth = characterWidth;
  }
}