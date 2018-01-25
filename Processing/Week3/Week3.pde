// Based on http://www.woodthatworks.com/kinetic-sculptures/nautilus.html

int centerKnobRadius = 10;
int smallFinCenterRadius = 18;

void setup() {
  size(200, 200);
  noStroke();
  noLoop();
}

void draw() {
  background(30, 30, 90);
  drawAxis(1);
  drawAxis(-1);
  drawCenterKnob();
}

void drawAxis(int direction) {
  drawSmallFinCenter();
  drawSmallFin(direction); // 6 times
  drawLargeFin(direction);
}

void drawSmallFinCenter() {
  fill(200, 200, 200);
  ellipse(width/2, height/2, smallFinCenterRadius, smallFinCenterRadius);
}

void drawLargeFin(int direction) {
  // draw two curveVertex groups by using circles
  LargeFin largeFin = new LargeFin(direction);
}

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
    this.finalCurveRadius = width*2/5;
    
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
  
  void drawSecondCurve() {
    float ellipseCenterX =  this.startX;
    float ellipseCenterY =  this.startY;
    float thetaStart = PI/2;
    float thetaEnd = TWO_PI * 3/4;
    float numberOfPoints = 40;
    float precision = (thetaEnd - thetaStart) / numberOfPoints;
    float startingRadius = this.currentY - this.startY;
    float endingRadius = this.finalCurveRadius;
    
    float radius = startingRadius;
    float radiusIncrement = (endingRadius - startingRadius) / (numberOfPoints / 2);
    
    float theta = thetaStart;
    for (int i = 0; i < numberOfPoints+1; i++) {
      if (i < numberOfPoints/2) {
        radius += radiusIncrement;
      }
      float x = cos(theta) * radius + ellipseCenterX;
      float y = sin(theta) * radius + ellipseCenterY;
      // println(x + ", " + y);
      curveVertex(x, y);
      // beginning and end must be drawn twice
      if (i == 0 || i == numberOfPoints -1) {
        curveVertex(x, y);
        // println(x + ", " + y);
      }
      theta += precision;
      this.currentX = x;
      this.currentY = y;
    }
    //starting at where we ended with drawFirstCurve, draw an increasingly larger circle with origins at this.startX/this.startY
  }
  
  void drawFirstCurve() {
    float ellipseCenterX =  firstCurveCenterRadius * cos(firstCurveCenterDirection) + this.startX;
    float ellipseCenterY =  firstCurveCenterRadius * sin(firstCurveCenterDirection) + this.startY;
    
    float thetaStart = this.firstCurveCenterDirection + PI;
    float thetaEnd = PI / 2;
    float numberOfPoints = 20;
    float precision = (thetaEnd - thetaStart) / numberOfPoints;

    float theta = thetaStart;
    for (int i = 0; i < numberOfPoints+1; i++) {
      float x = cos(theta) * firstCurveCenterRadius + ellipseCenterX;
      float y = sin(theta) * firstCurveCenterRadius + ellipseCenterY;
      // println(x + ", " + y);
      curveVertex(x, y);
      // beginning and end must be drawn twice
      if (i == 0 || i == numberOfPoints -1) {
        curveVertex(x, y);
        // println(x + ", " + y);
      }
      theta -= precision;
      this.currentX = x;
      this.currentY = y;
    }
    
    
    // ellipse(ellipseCenterX, ellipseCenterY, 20, 20);
  }
}

void drawCenterKnob() {
  fill(255);
  ellipse(width/2, height/2, centerKnobRadius, centerKnobRadius);
}