import processing.core.*;

class Buttonset {
  int DISTANCE_BETWEEN_STARTS_OF_BUTTONS = 40;
  PApplet p;
  SolarSystem solarSystem;
  UserInteractions userInteractions;

  Button[] buttons;
  int currentYPosition;

  Buttonset(PApplet p, SolarSystem solarSystem, UserInteractions userInteractions) {
    this.solarSystem = solarSystem;
    this.p = p;
    this.userInteractions = userInteractions;
    currentYPosition = 0;
    this.createButtons();
  }

  private void createButtons() {
    int buttonXPosition = p.width - 100;
    buttons = new Button[]{
      new MoveToEarthButton(this.p, solarSystem, userInteractions, "Place On Earth", buttonXPosition, this.buttonYPosition()),
      new PauseButton(this.p, solarSystem, userInteractions, "Pause", buttonXPosition, this.buttonYPosition())
    };
  }

  private int buttonYPosition() {
    int previousPosition = this.currentYPosition;
    this.currentYPosition += DISTANCE_BETWEEN_STARTS_OF_BUTTONS;
    return previousPosition;
  }

  void draw() {
    for (Button button : buttons) {
      button.draw();
    }
  }
}
