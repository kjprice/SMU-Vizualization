class CelestialObject{
  CelestialObject(){}
  int diameter;
  public float RATE_OF_ROTATION;
  public float PositionTheta;
  public float ROTATION_RADIUS_MILES;
  
  CelestialObject(int diameter, float RATE_OF_ROTATION, float PositionTheta, float ROTATION_RADIUS_MILES){
    this.diameter = diameter;
    this.RATE_OF_ROTATION = RATE_OF_ROTATION;
    this.PositionTheta = PositionTheta;
    this.ROTATION_RADIUS_MILES = ROTATION_RADIUS_MILES;
  }
  void draw(float x, float y) {
    int z = 40;
    spotLight(51, 102, 126, x, y, z, -1, 0, 0, PI/2, 200);
    pushMatrix();
    // TODO: Size of sun and distance from Earth
    translate(x, y, z);
    ambientLight(255, 204, 0);
    sphere(diameter);
    popMatrix();
  }
}