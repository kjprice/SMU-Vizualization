void setup() {
  size(334, 800);
  setDefaultValues();
}


void draw() {
  drawImage();
  blur(100);
  drawColorpicker();
  drawButtons();
  drawBlurWidthOptions();
}

// can also be used later to reset picture/settings to original state
void setDefaultValues() {
  buttonsDefaults();
  loadImageToFix();
  setBlurDefaults();
  blurWidthDefaults();
  setColorPickerDefaults();
}