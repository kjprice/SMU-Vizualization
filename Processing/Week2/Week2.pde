
static final int KJ_STARTING_POSITION_X = 20;
static final int KJ_STARTING_POSITION_Y = 20;

PImage KJ_IMAGE;
FamilyImage[] familyImages;


void setup() {
  size(880, 440);
  background(200);
  noLoop();
  KJ_IMAGE = loadImage(KJ_SELECTED_IMAGE);
  familyImages = createFamilyIMages();
}

void draw() {
  performKjSelfPortrait();
}