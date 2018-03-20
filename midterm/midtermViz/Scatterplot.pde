class Scatterplot extends GraphObject {
  private int X_MARGIN_LEFT = 40;
  private float maxX = 0;
  private float maxY = 0;
  private float minX = 0;
  private float minY = 0;
  private float[] x;
  private float[] y;
  private float[] z;
  private float zSplit;

  LinearRegression linearRegression;
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
    this.x = xx;
    this.y = yy;
    this.z = zz;
    this.yOffset = dashboard.getHeight() + 10; // some arbitrary value
    this.xMargin = this.X_MARGIN_LEFT;
    for (int i = 0; i < xx.length; i++) {
      float x = xx[i];
      float y = yy[i];
      float z = zz[i];

      this.createScatterplotPoint(x, y, z);
      this.checkRangeX(x);
      this.checkRangeY(y);
    }
    
    this.setPointRatio();
  }
  
  // the plot is going to have a fake width/height based on the actual width/height of window
  void setPointRatio() {
    this.xRatio = (width - this.xMargin) / (maxX - minX);
    this.yRatio = (height - this.yOffset) / (maxY - minY);
    this.xIncreaseToObtainZero = Math.abs(minX);
    this.yIncreaseToObtainZero = Math.abs(minY);
    for (ScatterplotPoint point : scatterplotPoints) {
      point.xIncreaseToObtainZero = this.xIncreaseToObtainZero;
      point.yIncreaseToObtainZero = this.yIncreaseToObtainZero;
      point.setPointRatio(this.xRatio, this.yRatio);
    }
  }
  
  
  
  float[][] getGroupedXy() {
    FloatList x1 = new FloatList();
    FloatList y1 = new FloatList();
    FloatList x2 = new FloatList();
    FloatList y2 = new FloatList();

    for (int i = 0; i < this.x.length; i++) {
      if (this.z[i] <= this.zSplit) {
        x1.append(this.x[i]);
        y1.append(this.y[i]);
      } else {
        x2.append(this.x[i]);
        y2.append(this.y[i]);
      }
    }
    
    return new float[][] {
      x1.array(),
      y1.array(),
      x2.array(),
      y2.array(),
    };
  }
  
  void showRegressionLine(float[] x, float[] y) {
    this.linearRegression = new LinearRegression(x, y);
    float yIntercept = this.linearRegression.beta0;
    float slope = this.linearRegression.beta1;

    beginShape();

    // show yIntercept
    float x1 = this.getWindowPointX(this.minX);
    float y1 = this.getWindowPointY((float)yIntercept);
    vertex(x1, (float)y1);

    // last point
    float x2 = this.getWindowPointX(maxX);
    double y2 = this.getWindowPointY(yIntercept + (slope * maxX));
    vertex(x2, (float)y2);

    endShape();
  }
  
  void showRegressionLines() {
    float[][] xy = getGroupedXy();
    float[] x1 = xy[0];
    float[] y1 = xy[1];
    stroke(this.group2Color);

    showRegressionLine(x1, y1);
    float[] x2 = xy[2];
    float[] y2 = xy[3];
    stroke(this.group1Color);
    showRegressionLine(x2, y2);
  }
  
  void draw() {
    this.drawPlotBoundaries();
    for (ScatterplotPoint point : scatterplotPoints) {
      point.draw();
    }
  }
  
  void createScatterplotPoint(float x, float y, float z) {
    scatterplotPoints.add(new ScatterplotPoint(this.X_MARGIN_LEFT, x, y, z, this.yOffset));
  }
  
  void groupByZGreaterThan(float zSplit) {
    this.zSplit = zSplit;
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

class ScatterplotPoint extends GraphObject {
  final int POINT_RADIUS = 10;
  float x;
  float y;
  float z;
  String groupName = "";
  
  ScatterplotPoint() {
  }

  ScatterplotPoint(float xMargin, float x, float y, int yOffset) {
    this.xMargin = xMargin;
    this.x = x;
    this.y = y;
    this.yOffset = yOffset;
  }
  
  ScatterplotPoint(float xMargin, float x, float y, float z, int yOffset) {
    this.xMargin = xMargin;
    this.x = x;
    this.y = y;
    this.z = z;
    this.yOffset = yOffset;
  }
  
  void drawColor() {
    switch (this.groupName) {
      case "Large":
        fill(this.group1Color);
        break;
      case "Small":
      default:
        fill(this.group2Color);
    }
    noStroke();
  }
  
  void draw() {
    float x = this.getWindowPointX(this.x);
    float y = this.getWindowPointY(this.y);
    this.drawColor();
    stroke(0, 0, 0, 100);
    ellipse(x, y, POINT_RADIUS, POINT_RADIUS);
  }
  
  void setGroup(String groupName) {
    this.groupName = groupName;
  }
}

class GraphObject {
  float yIncreaseToObtainZero = 0;
  float xIncreaseToObtainZero = 0;
  int yOffset; // space from bottom
  float xMargin; // space from left
  float xRatio; // ratio for what a number actually represents against the window
  float yRatio; // ratio for what a number actually represents against the window
  final float OPACITY = .5 * 255;
  color group1Color = color(255,0,10,OPACITY);
  color group2Color = color(243,197,10, OPACITY);
  GraphObject() {
  }
  
  void setPointRatio(float xRatio, float yRatio) {
    this.xRatio = xRatio;
    this.yRatio = yRatio;
  }
  
  float getWindowPointX(float virtualX) {
    return this.xMargin + (virtualX + this.xIncreaseToObtainZero) * this.xRatio;
  }

  float getWindowPointY(float virtualY) {
    float y = ((virtualY + this.yIncreaseToObtainZero) * this.yRatio);
    return (height - yOffset) - y; // flip y the right way
  }
  
  void drawPlotBoundaries() {
    int arrowWidth = 10;
    int arrowHeight = 20;
    stroke(0);
    strokeWeight(2);
    line(xMargin,height - yOffset,xMargin,0);
    line(xMargin,height - yOffset,width,height - yOffset);
    //arrows x
    line(width,height - yOffset, (width-arrowHeight), (height + arrowWidth - yOffset));
    line(width,height - yOffset, (width-arrowHeight), (height - arrowWidth - yOffset));
    //arrows y
    line(xMargin, 0, (xMargin + arrowWidth/2), height*0.03);
    line(xMargin, 0, (xMargin - arrowWidth/2), height*0.03);
  }
}