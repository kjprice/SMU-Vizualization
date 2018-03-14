class Scatterplot {
  private Table inputData;
  private float maxX = 0;
  private float maxY = 0;
  ArrayList<ScatterplotPoint> scatterplotPoints = new ArrayList<ScatterplotPoint>();
  
  Scatterplot() {
  }
  
  Scatterplot(Table inputData) {
    this.setup(inputData);
  }
  
  void setup(Table inputData) {
    this.inputData = inputData;
      for (TableRow row : inputData.rows()) {
        float x = row.getFloat("Guns.Per.Capita");
        float y = row.getFloat("Homicide");
        this.createScatterplotPoint(x, y);
        
        this.checkLargestX(x);
        this.checkLargestY(y);
      }
      
      println(this.maxX);
  }
  
  void draw() {
  }
  
  void createScatterplotPoint(float x, float y) {
    scatterplotPoints.add(new ScatterplotPoint(x, y));
  }
  
  void checkLargestX(float x) {
    if (x > this.maxX) {
      this.maxX = x;
    }
  }

  void checkLargestY(float y) {
    if (y > this.maxY) {
      this.maxY = y;
    }
  }
}

class ScatterplotPoint {
  final int POINT_RADIUS = 2;
  float x;
  float y;
  
  ScatterplotPoint() {
  }

  ScatterplotPoint(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void draw() {
  }
}