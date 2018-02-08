void setup() {
  size(334, 800);
  setDefaultValues();
}


void draw() {
  drawImage();
  color pickedColor = color(255,30,40);
  blur(200,400,100,pickedColor);
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