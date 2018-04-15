class Distance {
  private float MILES_TO_FIT_IN_PIXEL = 10;

  Distance() {}

  public float getObjectScale(int miles) {
    return miles / this.MILES_TO_FIT_IN_PIXEL;
  }
}
