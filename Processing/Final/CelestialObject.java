import processing.core.*;

class CelestialObject {
  Distance distance = new Distance();
  PApplet p;

  CelestialObject(PApplet p){
    this.p = p;
  }
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
  private float radiusChange = 0.25F;
  private boolean summerToWinter = true;
  private float radius;

  private long epoch = 1529542696;
  private int x;
  private int z;

  private boolean isTransparent = false;

  
  CelestialObject(PApplet p, int diameter, float rateOfRotation, float PositionTheta, float radiusInMiles, boolean isYearChange,boolean isTransparent){
    this.p = p;
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
    this.PositionTheta += p.TWO_PI * this.rateOfRotation / 360;
  }

  void draw(float distance) {
    float[] xyz = this.calculatePosition(distance);
    float x = xyz[0];
    float y = xyz[1];
    float z = xyz[2];
    p.fill(255);
    if (this.producesLight) {
      p.ambientLight(255, 204, 0);
    }
    if (this.isTransparent) {
      p.fill(255, 204, 0,64);
    }
    p.pushMatrix();
    p.translate(x, y, z);
    p.sphere(this.distance.getObjectScale(diameter));
    p.popMatrix();
    this.orbit();
    
  
    if(radiusInMiles%6 == 0){
      epoch+=86400;
    }
      
    String date = new java.text.SimpleDateFormat("dd/MMMM").format(new java.util.Date (epoch*1000L));
    // TODO: This could cause breakage
    p.pushMatrix();
    p.rotateX(300);
    p.translate(-40,-80,-80);
    p.translate(-80,-105,0);
    p.fill(255,255,255);
    p.rect(-120,-25,130,30);
    p.fill(0);
   p.text(date,-80,-7);
    
    p.popMatrix();
  }

  void iluminateOtherObjects(float distance) {
    float[] xyz = this.calculatePosition(distance);
    float x = xyz[0];
    float y = xyz[1];
    float z = xyz[2];
   p.pointLight(255, 240, 140, x, y, z);
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

    
    float x =p.cos(PositionTheta) * this.distance.getObjectScale((int)radiusInMiles);
    float y =p.sin(PositionTheta) * this.distance.getObjectScale((int)radiusInMiles);
   
    // TODO: Calculate z based on some distance multiplier too (3k miles from earth)
    float z = distance;
    return new float[] { x, y, z };
  }  
}
