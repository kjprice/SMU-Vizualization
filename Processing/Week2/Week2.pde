
static final int SIZE_OF_BOXES_TO_REPLACE = 40;
static final int KJ_STARTING_POSITION_X = 20;
static final int KJ_STARTING_POSITION_Y = 20;

PImage KJ_IMAGE;
FamilyImage[] familyImages;

// Main Setup and Draw Blocks 
void setup() {
  size(840, 840);
  background(200);
  noLoop();
  KJ_IMAGE = loadImage(SELECTED_IMAGE);
  VB_IMAGE = loadImage(VIV_SELECTED_IMG);
  familyImages = createFamilyIMages();
}

void draw() {
  performKjSelfPortrait();
  // performSelfPortraitViv();
}