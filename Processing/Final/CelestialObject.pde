class CelestialObject{
  Distance distance = new Distance();

  CelestialObject(){}
  private int diameter;
  private boolean producesLight = false;
  public float rateOfRotation;
  public float PositionTheta;

  private float distanceMultiplier;
  private float distanceRatio;

  private float currentX;
  private float currentY;

  private float radiusInMiles;
  private boolean isYearChange;
  private float radiusChange=0.25;
  private boolean summerToWinter = true;
  private float radius;

  private long epoch = 1529542696;
  private int x;
  private int z;

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
    fill(255);
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
    
  
    if(radiusInMiles%6 == 0){
      epoch+=86400;
    }
      
    String date = new java.text.SimpleDateFormat("dd/MMMM").format(new java.util.Date (epoch*1000L));  
    pushMatrix();
    if(!solarSystem.getIsOnEarth()){
      //rotateX(300);
      //translate(-40,-80,-80);
      translate(-80,-105,0);
      fill(255,255,255);
      rect(-120,-25,130,30);
      fill(0);
      text(date,-80,-7);
    }
    else{

    }

    popMatrix();
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
      if (this.radiusInMiles>2948 | this.radiusInMiles<this.radius){
        this.summerToWinter = !this.summerToWinter;
      }
      if (summerToWinter){
        this.radiusInMiles+=this.radiusChange;
      }
      else{
        this.radiusInMiles-=this.radiusChange;
      }
    }

 
    this.distanceMultiplier=this.distanceRatio * this.radiusInMiles;

    
    float x = cos(PositionTheta) * this.distance.getObjectScale((int)radiusInMiles);
    float y = sin(PositionTheta) * this.distance.getObjectScale((int)radiusInMiles);
   
    // TODO: Calculate z based on some distance multiplier too (3k miles from earth)
    float z = distance;
    return new float[] { x, y, z };
  }  
}