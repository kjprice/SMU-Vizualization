
class LargeFin {
  private int direction;
  private int startX;
  private int startY;
  private int firstCurveCenterRadius;
  private float firstCurveCenterDirection = PI*5/10;
  private float finalCurveRadius;
  private float currentX;
  private float currentY;

  LargeFin(int direction) {
    this.direction = direction;
    this.startX = width/2;
    this.startY = height/2;
    this.firstCurveCenterRadius = width/5;
    this.finalCurveRadius = width*4.5/10;
    
    this.drawLargeFin();
  }
  
  private void drawLargeFin() {
    noFill();
    stroke(111);
    beginShape();
    this.drawFirstCurve();
    this.drawSecondCurve();
    endShape();
  }

  void drawFirstCurve() {
    float ellipseCenterX =  firstCurveCenterRadius * cos(firstCurveCenterDirection) + this.startX;
    float ellipseCenterY =  firstCurveCenterRadius * sin(firstCurveCenterDirection) + this.startY;
    
    float thetaStart = this.firstCurveCenterDirection + PI;
    float thetaEnd = PI / 2;

    int direction = 1;
    drawCurve(firstCurveCenterRadius, firstCurveCenterRadius, thetaStart, thetaEnd, ellipseCenterX, ellipseCenterY, direction);
  }

  void drawSecondCurve() {
    float ellipseCenterX =  this.startX;
    float ellipseCenterY =  this.startY;
    float thetaStart = PI/2;
    float thetaEnd = TWO_PI * 3/4;
    float startingRadius = this.currentY - this.startY;
    float endingRadius = this.finalCurveRadius;
    int direction = 1;
    drawCurve(startingRadius, endingRadius, thetaStart, thetaEnd, ellipseCenterX, ellipseCenterY, direction);
  }

  void drawCurve(float startingRadius, float endingRadius, float thetaStart, float thetaEnd, float ellipseCenterX, float ellipseCenterY, int direction) {
    float radius = startingRadius;
    float precision = .05;
    float numberOfPoints = (abs((thetaEnd - thetaStart) / precision));
    float radiusIncrement = (endingRadius - startingRadius) / (numberOfPoints / 2);
    println(numberOfPoints);
    
    println(firstCurveCenterRadius, firstCurveCenterRadius, thetaStart, thetaEnd, ellipseCenterX, ellipseCenterY, direction);
    
    float theta = thetaStart;
    for (int i = 0; i < numberOfPoints+1; i++) {
      float x = cos(theta) * radius + ellipseCenterX;
      float y = sin(theta) * radius + ellipseCenterY;
      curveVertex(x, y);
      // beginning and end must be drawn twice
      if (i == 0 || i == numberOfPoints -1) {
        curveVertex(x, y);
      }
      if (direction == 1) {
        theta += precision;
      }
      else {
        theta -= precision;
      }
      if (i < numberOfPoints/2) {
        radius += radiusIncrement;
      }
      this.currentX = x;
      this.currentY = y;
    }
  }
}