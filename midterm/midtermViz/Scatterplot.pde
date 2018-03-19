class Scatterplot {
  private float maxX = 0;
  private float maxY = 0;
  private float minX = 0;
  private float minY = 0;
  private int yOffset;
  ArrayList<ScatterplotPoint> scatterplotPoints = new ArrayList<ScatterplotPoint>();
  
  Scatterplot() {
  }
  
  Scatterplot(float[] x, float[] y) {
    float z[] = new float[y.length];
    this.setup(x, y, z);
  }
  
  Scatterplot(float[] x, float[] y, float[] z) {
    this.setup(x, y, z);
  }
  
  void setup(float[] xx, float[] yy, float[] zz) {
    this.yOffset = dashboard.getHeight() + 100; // some arbitrary value
    for (int i = 0; i < xx.length; i++) {
      float x = xx[i];
      float y = yy[i];
      float z = zz[i];

      this.createScatterplotPoint(x, y, z);
      this.checkRangeX(x);
      this.checkRangeY(y);
    }
  }
  
  void draw() {
    for (ScatterplotPoint point : scatterplotPoints) {
      point.draw(this.minX, this.minY, this.maxX, this.maxY, this.yOffset);
    }
  }
  
  void createScatterplotPoint(float x, float y, float z) {
    scatterplotPoints.add(new ScatterplotPoint(x, y, z));
  }
  
  void groupByZGreaterThan(float zSplit) {
    for (ScatterplotPoint point : this.scatterplotPoints) {
      if (point.z > zSplit) {
        point.setGroup("Large");
      } else {
        point.setGroup("Small");
      }
    }
  }

  void checkRangeX(float x) {
    if (x > this.maxX) {
      this.maxX = x;
    }
    if (x < this.minX) {
      this.minX = x;
    }
  }
  
  void checkRangeY(float y) {
    if (y > this.maxY) {
      this.maxY = y;
    }
    if (y < this.minY) {
      this.minY = y;
    }
  }
}

class ScatterplotPoint {
  final int POINT_RADIUS = 10;
  final float OPACITY = .4;
  float x;
  float y;
  float z;
  String groupName = "";
  
  ScatterplotPoint() {
  }

  ScatterplotPoint(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  ScatterplotPoint(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  void drawColor() {
    float opacity = OPACITY * 255;
    switch (this.groupName) {
      case "Large":
        fill(255, 100, 100, opacity);
        break;
      case "Small":
      default:
        fill(100, 255, 100, opacity);
    }
    noStroke();
  }
  
  void draw(float minX, float minY, float maxX, float maxY, int yOffset) {
    // todo: use dynamic variables instead
    float xRatio = width / maxX;
    float yRatio = height / maxY;
    float x = this.x * xRatio;
    float y = (height - yOffset) - (this.y * yRatio); // flip y the right way
    this.drawColor();
    ellipse(x, y, POINT_RADIUS, POINT_RADIUS);
  }
  
  void setGroup(String groupName) {
    this.groupName = groupName;
  }
}