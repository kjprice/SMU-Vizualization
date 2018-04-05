class UserInteractions {
  ArrayList<UserControl> userControls;
  UserInteractions() {
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

void mouseClicked() {
  userInteractions.checkIfClicked();
}
