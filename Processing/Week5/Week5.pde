/******************************************************************
Description: use image processing ideas to blur sections of image
Team: Ekatrina, KJ Price, Preeti
******************************************************************/

void setup() {
  size(334, 800);
  setDefaultValues();
}


void draw() {
  drawImage();
  blur(THICKNESS);
  drawColorpicker();
  // This is reset button to bring image back to original
  drawButtons();
  // to increase thinckness of blurring brush, select from 2 options
  drawBlurWidthOptions();
  // on mouser over buttons, do not apply colour
  overButton();
}

// can also be used later to reset picture/settings to original state
// We might not need this????
void setDefaultValues() {
  buttonsDefaults();
  loadImageToFix();
  setBlurDefaults();
  blurWidthDefaults();
  setColorPickerDefaults();
}