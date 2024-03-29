SolarSystem solarSystem;
UserDashboard userDashboard;
UserInteractions userInteractions;

void setup() {
  size(800, 600, P3D);
  userInteractions = new UserInteractions(this);
  solarSystem = new SolarSystem(this);
  userDashboard = new UserDashboard(this, solarSystem, userInteractions);
}

void draw() {
  solarSystem.draw();
  userDashboard.draw();
}

void mouseClicked() {
  userInteractions.checkIfClicked();
}
