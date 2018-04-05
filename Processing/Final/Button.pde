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
    fill(255,20,30);
    rect(positionStartX, positionStartY, this.elementWidth, this.elementHeight);
    // TODO: Why isn't text showing?
    fill(0);
    textSize(12);
    text(buttonText, positionStartX, positionStartY+10);
  }
}

class MoveToEarthButton extends Button {
    MoveToEarthButton(String buttonText, int x, int y) {
    super(buttonText, x, y);
  }

  void onClick() {
    solarSystem.moveToEarth();
    solarSystem.isOnEarth = !solarSystem.isOnEarth;
  }
}