class Scatterplot {
  private float maxX = 0;
  private float maxY = 0;
  private float minX = 0;
  private float minY = 0;
  private int yOffset;
  ArrayList<ScatterplotPoint> scatterplotPoints = new ArrayList<ScatterplotPoint>();
  
  Scatterplot() {
  }
  
  Scatterplot(Table inputData) {
    this.setup(inputData);
  }
  
  void setup(Table inputData) {
    this.yOffset = dashboard.getHeight() + 100; // some arbitrary value
    for (TableRow row : inputData.rows()) {
      float x = row.getFloat("Guns per 100");
      float y = row.getFloat("Homicide per 100k");
      this.createScatterplotPoint(x, y);
      
      this.checkRangeX(x);
      this.checkRangeY(y);
    }
  }
  
  void draw() {
    for (ScatterplotPoint point : scatterplotPoints) {
      point.draw(this.minX, this.minY, this.maxX, this.maxY, this.yOffset);
    }
  }
  
  void createScatterplotPoint(float x, float y) {
    scatterplotPoints.add(new ScatterplotPoint(x, y));
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
  final int POINT_RADIUS = 4;
  float x;
  float y;
  
  ScatterplotPoint() {
  }

  ScatterplotPoint(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void draw(float minX, float minY, float maxX, float maxY, int yOffset) {
    // todo: use dynamic variables instead
    float xRatio = width / maxX;
    float yRatio = height / maxY;
    float x = this.x * xRatio;
    float y = (height - yOffset) - (this.y * yRatio); // flip y the right way
    fill(255);
    ellipse(x, y, POINT_RADIUS, POINT_RADIUS);
  }
}