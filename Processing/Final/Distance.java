import processing.core.*;

class Distance {
  private float MILES_TO_FIT_IN_PIXEL = 10;
  PApplet p;

  Distance() {}

  public float getObjectScale(int miles) {
    return miles / this.MILES_TO_FIT_IN_PIXEL;
  }
}
