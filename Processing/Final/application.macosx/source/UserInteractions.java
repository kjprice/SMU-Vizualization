import processing.core.*;
import java.util.ArrayList;

class UserInteractions {
  ArrayList<UserControl> userControls;
  PApplet p;
  UserInteractions(PApplet p) {
    this.p = p;
    userControls = new ArrayList<UserControl>();
  }

  void push(UserControl userControl) {
    this.userControls.add(userControl);
  }

  public void checkIfClicked() {
    for (UserControl userControl : userControls) {
      userControl.checkIfClicked();
    }
  }
}
