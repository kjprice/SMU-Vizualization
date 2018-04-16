import processing.core.*;

class UserDashboard{
  private Buttonset buttonset;

  UserDashboard(PApplet p, SolarSystem solarSystem, UserInteractions userInteractions) {
    this.buttonset = new Buttonset(p, solarSystem, userInteractions);
  }

  void draw() {
    this.buttonset.draw();
  }
}
