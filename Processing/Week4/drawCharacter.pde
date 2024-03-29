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

float JUMP_PLAYER_MULTIPIER = .23; // strength of jump compared to height of character

void performJump() {
  if (characterVelocityY == 0) {
    characterVelocityY = -characterHeight * JUMP_PLAYER_MULTIPIER;
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
  
  characterVelocityY = newVelocityWithGravity(characterVelocityY);
}

boolean characterTooFarLeft() {
   return characterPositionX < 0;
}

boolean characterTooFarRight() {
   return characterPositionX + maxCharacterWidth > width;
}

void winTheGame() {
  gameOver = true;
}

boolean characterAtBottomOfScreen() {
  return (characterPositionY + characterHeight) > height;
}

void performCharacterCollisionDetection() {
  if (characterGoalCollision()) {
    winTheGame();
    // return;
  }
  if (characterTooFarLeft()) {
    characterPositionX = 0;
    characterVelocityX = 0;
  }
  if (characterTooFarRight()) {
    characterPositionX = width - maxCharacterWidth;
    characterVelocityX = 0;
  }
  
  if (characterAboveAndInsideSlope()) {
    characterPositionY = slopePositionEndY - characterHeight;
    characterVelocityY = 0;
  }
  
  if (characterAtBottomOfScreen()) {
    characterPositionY = height - characterHeight;
    characterVelocityY = 0;
  }

  // TODO if we are outside of the slope, let fall
  // TODO if user's feet are below slope, prevent from running into slope
}

void calculateCharacterPosition() {
  characterRunningSpeed = (width) / frameRate;
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