class Buttonset {
  int DISTANCE_BETWEEN_STARTS_OF_BUTTONS = 40;

  Button[] buttons;
  int currentYPosition;

  Buttonset() {
    currentYPosition = 0;
    this.createButtons();
  }

  private void createButtons() {
    int buttonXPosition = width - 100;
    buttons = new Button[]{
      new MoveToEarthButton("Place On Earth", buttonXPosition, this.buttonYPosition())
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
