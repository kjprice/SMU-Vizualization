SolarSystem solarSystem;
UserDashboard userDashboard;
UserInteractions userInteractions;

void setup() {
  size(800, 600, P3D);
  userInteractions = new UserInteractions();
  solarSystem = new SolarSystem();
  userDashboard = new UserDashboard();
}

void draw() {
  solarSystem.draw();
  userDashboard.draw();
}
