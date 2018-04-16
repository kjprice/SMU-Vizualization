class UserDashboard{
  private Buttonset buttonset;
  PApplet p;

  UserDashboard(PApplet p) {
    this.p = p;
    this.buttonset = new Buttonset();
  }

  void draw() {
    this.buttonset.draw();
  }
}
