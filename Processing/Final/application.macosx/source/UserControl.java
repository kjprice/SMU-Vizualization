import processing.core.*;

abstract class UserControl {
  protected SolarSystem solarSystem;
  protected int positionStartX = -1;
  protected int positionStartY = -1;
  protected float elementWidth = -1;
  protected float elementHeight = -1;
  protected PApplet p;
  
  UserControl() {}

  UserControl(PApplet p, SolarSystem solarSystem, UserInteractions userInteractions) {
    this.p = p;
    this.solarSystem = solarSystem;
    userInteractions.push(this);
  }

  void onClick() {}

  protected void checkIfClicked() {
    // make sure that defaults have changed
    if (this.positionStartX == -1 || this.positionStartY == -1 || this.elementWidth == -1 || this.elementHeight == -1) {
      return;
    }

    if (
     p.mouseX >= this.positionStartX && p.mouseX <= (this.positionStartX + this.elementWidth) &&
     p.mouseY >= this.positionStartY && p.mouseY <= (this.positionStartY + this.elementHeight)
    ) {
      this.onClick();
    }
  }
}
