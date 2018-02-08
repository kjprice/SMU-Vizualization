color selectedColor;
color hoverColor;
boolean colorIsSet;

final static int COLOR_PICKER_WIDTH = 30;
final static int COLOR_OFFSET_POSITION_X = COLOR_PICKER_WIDTH * 3 / 4;
final static int COLOR_OFFSET_POSITION_Y = 0;

void setColorPickerDefaults() {
  selectedColor = color(255, 255, 255);
  colorIsSet = false;
}

float[] calculateColorPickerPosition() {
  float colorPositionX = COLOR_OFFSET_POSITION_X + mouseX;
  float colorPositionY = COLOR_OFFSET_POSITION_Y + mouseY;
  
  if (colorPositionX + (COLOR_PICKER_WIDTH / 2) > width) {
    colorPositionX = mouseX - COLOR_OFFSET_POSITION_X;
  }
  return new float[] { colorPositionX, colorPositionY };
}

void setHoverColor() {
  hoverColor = selectedColor = get(mouseX, mouseY);
}

void drawColorpicker() {
  float[] colorPosiition = calculateColorPickerPosition();
  if (colorIsSet) {
    fill(selectedColor);
  }
  else {
    setHoverColor();
    fill(hoverColor);
  }
  ellipse(colorPosiition[0], colorPosiition[1], COLOR_PICKER_WIDTH, COLOR_PICKER_WIDTH);
}