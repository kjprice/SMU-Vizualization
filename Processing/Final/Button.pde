class Button extends UserControl {
  private String buttonText;

  Button() {
  }

  Button (String buttonText, int x, int y) {
    super();
    this.positionStartX = x;
    this.positionStartY = y;
    this.buttonText = buttonText;
    setWidth(this.getTextWidth());
    setHeight(18);
  }

  public void setWidth(float buttonWidth) {
    this.elementWidth = buttonWidth;
  }

  public void setHeight(float buttonHeight) {
    this.elementHeight = buttonHeight;
  }

  public float getTextWidth() {
    return textWidth(buttonText);
  }

  void draw() {
    textSize(220);
    pushMatrix();
    rect(positionStartX, positionStartY, this.elementWidth, this.elementHeight);
    // TODO: Why isn't text showing?
    text(buttonText, positionStartX, positionStartY);
    popMatrix();
  }
}

class MoveToEarthButton extends Button {
  MoveToEarthButton(String buttonText, int x, int y) {
    super(buttonText, x, y);
  }

  void onClick() {
    solarSystem.moveToEarth();
  }
}
