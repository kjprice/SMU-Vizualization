class CelestialObject{
  Distance distance = new Distance();

  CelestialObject(){}
  private int diameter;
  private boolean producesLight = false;
  public float rateOfRotation;
  public float PositionTheta;
  private float currentX;
  private float currentY;
  private float radiusInMiles;
  private boolean isYearChange;
  private float radiusChange=0.233;
  private boolean summerToWinter = true;
  private float radius;
  private boolean isTransparent = false;
  
  CelestialObject(int diameter, float rateOfRotation, float PositionTheta, float radiusInMiles, boolean isYearChange,boolean isTransparent){
    this.diameter = diameter;
    this.rateOfRotation = rateOfRotation;
    this.PositionTheta = PositionTheta;
    this.radiusInMiles = radiusInMiles;
    this.isYearChange = isYearChange;
    this.radius = radiusInMiles;
    this.isTransparent = isTransparent;
  }
  
  

  void enableLightSource() {
    this.producesLight = true;
  }

  // move celestial body around a central point
  private void orbit() {
    this.PositionTheta += TWO_PI * this.rateOfRotation / 360;
  }

  void draw(float distance) {
    float[] xyz = this.calculatePosition(distance);
    float x = xyz[0];
    float y = xyz[1];
    float z = xyz[2];
    if (this.producesLight) {
      ambientLight(255, 204, 0);
    }
    if (this.isTransparent) {
      fill(255, 204, 0,64);
    }
    pushMatrix();
      translate(x, y, z);
      sphere(this.distance.getObjectScale(diameter));
    popMatrix();

    this.orbit();
  }

  void iluminateOtherObjects(float distance) {
    float[] xyz = this.calculatePosition(distance);
    float x = xyz[0];
    float y = xyz[1];
    float z = xyz[2];
    pointLight(255, 240, 140, x, y, z);
  }

  float[] calculatePosition(float distance) {
    if (this.isYearChange){
      if (this.radiusInMiles>2850){
        this.summerToWinter=false;
      }
      if (this.radiusInMiles<this.radius){
        this.summerToWinter=true;
      }
      if (summerToWinter){
        this.radiusInMiles+=this.radiusChange;
      }
      else{
        this.radiusInMiles-=this.radiusChange;
      }
    }
    
    float x = cos(PositionTheta) * this.distance.getObjectScale((int)radiusInMiles);
    float y = sin(PositionTheta) * this.distance.getObjectScale((int)radiusInMiles);
   
    // TODO: Calculate z based on some distance multiplier too (3k miles from earth)
    float z = distance;
    return new float[] { x, y, z };
  }
 }
