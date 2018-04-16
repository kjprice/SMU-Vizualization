import processing.core.*;

class Button extends UserControl {
  private String buttonText;

  Button() {
    super();
  }

  Button (PApplet p, SolarSystem solarSystem, UserInteractions userInteractions, String buttonText, int x, int y) {
    super(p, solarSystem, userInteractions);
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
    return p.textWidth(buttonText);
  }

  void draw() {
   p.fill(255,20,30);
   p.rect(positionStartX, positionStartY, this.elementWidth, this.elementHeight);
    // TODO: Why isn'tp.text showing?
   p.fill(0);
   p.textSize(12);
   p.text(buttonText, positionStartX, positionStartY+12);
  }
}

class MoveToEarthButton extends Button {
  MoveToEarthButton(PApplet p, SolarSystem solarSystem, UserInteractions userInteractions, String buttonText, int x, int y) {
    super(p, solarSystem, userInteractions, buttonText, x, y);
  }
  
  void onClick() {
    solarSystem.moveToEarth();
  }
}

class PauseButton extends Button {
  PauseButton(PApplet p, SolarSystem solarSystem, UserInteractions userInteractions, String buttonText, int x, int y) {
    super(p, solarSystem, userInteractions, buttonText, x, y);
  }
  
  void onClick() {
    solarSystem.pauseAnimations();
  }
}
