class CelestialObject{
  CelestialObject(){}
  private int diameter;
  private boolean producesLight = false;
  public float rateOfRotation;
  public float PositionTheta;
  private float currentX;
  private float currentY;
  private float distanceMultiplier;
  
  CelestialObject(int diameter, float rateOfRotation, float PositionTheta, float distanceRatio, float radiusInMiles){
    this.diameter = diameter;
    this.rateOfRotation = rateOfRotation;
    this.PositionTheta = PositionTheta;
    this.distanceMultiplier = this.createDistanceMultiplier(distanceRatio, radiusInMiles);
  }

  float createDistanceMultiplier(float distanceRatio, float radiusInMiles) {
    return distanceRatio * radiusInMiles;
  }

  void enableLightSource() {
    this.producesLight = true;
  }

  // move celestial body around a central point
  private void orbit() {
    this.PositionTheta += TWO_PI * this.rateOfRotation / 360;
  }

  void draw() {
    float[] xyz = this.calculatePosition();
    float x = xyz[0];
    float y = xyz[1];
    float z = xyz[2];
    if (this.producesLight) {
      ambientLight(255, 204, 0);
    }
    pushMatrix();
    translate(x, y, z);
    sphere(diameter);
    popMatrix();

    this.orbit();
  }

  void iluminateOtherObjects() {
    float[] xyz = this.calculatePosition();
    float x = xyz[0];
    float y = xyz[1];
    float z = xyz[2];
    pointLight(255, 240, 140, x, y, z);
  }

  float[] calculatePosition() {
    float x = cos(PositionTheta) * this.distanceMultiplier;
    float y = sin(PositionTheta) * this.distanceMultiplier;
    // TODO: Calculate z based on some distance multiplier too (3k miles from earth)
    int z = 40;
    return new float[] { x, y, z };
  }
}
