PImage goalImage;
float goalHeight;
float goalWidth;
float goalPositionX;
float goalPositionY;

float textSize;
float textPositionX;
float textPositionY;

float GOAL_HEIGHT_RATIO = .4; // height of goal compared to height of window

void gameOverText() {
  fill(255, 40, 40);
  text("YOU WIN!!", textPositionX, textPositionY); 
}

void setupGameOverText() {
  textSize = width * .10;
  textPositionX = textSize;
  textPositionY = height / 2 - textSize;
  textSize(textSize);
}

void setupGoal() {
  // source https://www.mariowiki.com/images/0/0f/OvertheFlagpole.png
  goalImage = loadImage("images/OvertheFlagpole.png");
  
  goalHeight = GOAL_HEIGHT_RATIO * height;
  goalWidth =  (goalImage.width / float(goalImage.height)) * goalHeight;
  goalPositionX = width - goalWidth;
  goalPositionY = slopePositionEndY - goalHeight;
}

void drawGoal() {
  image(goalImage, goalPositionX, goalPositionY, goalWidth, goalHeight);
}

boolean characterGoalCollionsX() {
  return characterWidth + characterPositionX >= goalPositionX;
}

boolean characterGoalCollionsY() {
  return characterHeight + characterPositionY >= goalPositionY
    && characterPositionY <= (goalPositionY + goalHeight);
}

boolean characterGoalCollision() {
  return characterGoalCollionsX() && characterGoalCollionsY();
}