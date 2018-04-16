/*
  Distance to sun is approximately 3k miles: https://wiki.tfes.org/Distance_to_the_Sun
  Diameter of Earth is approximately 25k miles: https://theflatearthsociety.org/tiki/tiki-index.php?page=Eratosthenes+on+Diameter
*/
import processing.core.*;

public class SolarSystem {
  Distance distance = new Distance();
  PApplet p;

  int EARTH_DIAMETER_MILES       = 25000;
  int SUN_DIAMETER_MILES         = 500;
  int SUNLIGHT_DIAMETER_MILES    = 800;
  int MOON_DIAMETER_MILES        = 200;
  int DISTANCE_TO_SUN            = 3000;
  int SUN_ROTATION_RADIUS_MILES  = 2450;
  int MOON_ROTATION_RADIUS_MILES = 1400;
  int EYE_POSITION_START_MILES   = -12000;
  float SUN_RATE_OF_ROTATION = 1.5F; // Number of degrees changed per frame
  float MOON_RATE_OF_ROTATION = 0.535F; // Number of degrees changed per frame

  // For animation purposes
  float currentXRotation = 0;
  float futureXRotation = 0;

  float currentTranslateZ = distance.getObjectScale(EYE_POSITION_START_MILES);
  float futureTranslateZ = currentTranslateZ;
   
  //date
  private long epoch = 1529542696;

  // our solar system objects
  CelestialObject sun;
  CelestialObject sunlight;
  Earth earth;
  CelestialObject moon;
 
  // number of miles that are comprised in every pixel
  float sunPositionTheta = p.TWO_PI;
  float moonPositionTheta = p.PI;
  boolean isOnEarth = false;
  boolean allowAnimations = true;
  Star[] stars = new Star[2000];

  SolarSystem(PApplet p) {
    this.p = p;
    earth = new Earth(p);
    sun = new CelestialObject(p, SUN_DIAMETER_MILES, SUN_RATE_OF_ROTATION, sunPositionTheta, SUN_ROTATION_RADIUS_MILES, true,false);
    sunlight  = new CelestialObject(p, SUNLIGHT_DIAMETER_MILES, SUN_RATE_OF_ROTATION, sunPositionTheta, SUN_ROTATION_RADIUS_MILES, true,true);
    sun.enableLightSource();
    moon = new CelestialObject(p, MOON_DIAMETER_MILES, MOON_RATE_OF_ROTATION, moonPositionTheta, MOON_ROTATION_RADIUS_MILES, false,false);
    // plenty of stars
    for (int i = 0; i < stars.length; i++) {
        stars[i] = new Star(p);
     }
  }
 
  void draw() {
   p.background(0);
   // Oh the darkness of space
   p.fill(255);
   p.pushMatrix();
   displayDate();
   p.translate(p.width/2, p.height/2, this.currentTranslateZ);
   p.rotateX(p.radians(this.currentXRotation));
   this.drawCelestialBodies();
   p.popMatrix();

    setCamera();
    this.animateTransitions();
    for (int i = 0; i < stars.length; i++) {
      stars[i].update();
      stars[i].show();
    }
  }
  
  void pauseAnimations() {
    this.allowAnimations = !allowAnimations;
  }

  void displayDate() {
    if(sun.getRadiusInMiles() % 22 == 0){
      epoch += 86400;
    }

    String date = new java.text.SimpleDateFormat("dd/MMMM").format(new java.util.Date (epoch*1000L));
    p.pushMatrix();
    p.translate(0,0,0);
    p.fill(255,255,255);
    p.rect(0,5,100,30);
    p.fill(0);
    p.text(date,10,24);    
    p.popMatrix();
  }

  // The order of each item is important due to lighting - the moon should not have ambient light but should have light casted upon it
  void drawCelestialBodies() {
    this.earth.draw(distance.getObjectScale(EARTH_DIAMETER_MILES));
    this.sun.iluminateOtherObjects(distance.getObjectScale(DISTANCE_TO_SUN));
    this.moon.draw(distance.getObjectScale(DISTANCE_TO_SUN));
    this.sun.draw(distance.getObjectScale(DISTANCE_TO_SUN));
    this.sunlight.draw(distance.getObjectScale(DISTANCE_TO_SUN)); // check ifp.camera is on Earth
  }

  void moveToEarth() {
    this.isOnEarth = !this.isOnEarth;

    if (isOnEarth){
      this.futureXRotation = 87;
      this.futureTranslateZ = 400;
    } else {
       this.futureXRotation = 0;
       this.futureTranslateZ = 300;
    }
  }

  void animateTransitions() {
    this.animateXRotation();
    this.animateTranlationZ();
  }

  void animateTranlationZ() {
    if (!this.allowAnimations) {
      return;
    }
    if (this.currentTranslateZ == this.futureTranslateZ) {
      return;
    }
    if (this.isOnEarth) {
      this.currentTranslateZ++;
    }
    else {
      this.currentTranslateZ--;
    }
  }

  void animateXRotation() {
    if (!this.allowAnimations) {
      return;
    }
    if (this.currentXRotation == this.futureXRotation) {
      return;
    }
    if (this.isOnEarth) {
      this.currentXRotation++;
    }
    else {
       this.currentXRotation--;
    }
  }

  void setCamera() {
   p.camera(p.width/2.0F, p.height/2F, (p.height/2.0F) / p.tan((float)p.PI*30.0F / 180.0F),
      p.width/2.0F, p.height/2.0F, 0,
      0, 1, 0);
  }
  
  public boolean getIsOnEarth(){
    return isOnEarth;
  }
  
  public CelestialObject getSun(){
    return sun;
  }
}
