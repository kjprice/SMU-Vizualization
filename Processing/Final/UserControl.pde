abstract class UserControl {
  protected int positionStartX = -1;
  protected int positionStartY = -1;
  protected float elementWidth = -1;
  protected float elementHeight = -1;

  UserControl() {
    userInteractions.push(this);
  }

  void onClick() {}

  protected void checkIfClicked() {
    // make sure that defaults have changed
    if (this.positionStartX == -1 || this.positionStartY == -1 || this.elementWidth == -1 || this.elementHeight == -1) {
      return;
    }

    if (
      mouseX >= this.positionStartX && mouseX <= (this.positionStartX + this.elementWidth) &&
      mouseY >= this.positionStartY && mouseY <= (this.positionStartY + this.elementHeight)
    ) {
      this.onClick();
    }
  }
}
