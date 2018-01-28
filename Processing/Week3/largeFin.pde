
class LargeFin {
  private int direction;
  private float startX;
  private float startY;
  private int firstCurveCenterRadius;
  private float firstCurveCenterDirection = PI*5/10;
  private float finalCurveRadius;
  private float currentX;
  private float currentY;

  LargeFin(int direction) {
    this.direction = direction;
    this.firstCurveCenterRadius = width/5;
    this.finalCurveRadius = width*4.5/10;
    
    // this.drawShadow();
    
    this.drawLargeFin(largeFinColorBase, originX, originY);
  }
  
  void drawShadow() {
    float x = shadowDirectionX + originX;
    float y = shadowDirectionY + originY;
    
    this.drawLargeFin(largeFinColorShadow, x, y);
  }

  private void drawLargeFin(color c, float x, float y) {
    this.startX = x;
    this.startY = y;
    // noFill();
    // stroke(171, 129, 100);
    fill(c);
    pushMatrix();
    if (this.direction != 1) {
      rotateY(PI);
    }
    beginShape();
    // PImage darkWoodImage = loadImage("images/wood_texture.png");
    // texture(darkWoodImage);
    this.drawFirstCurve();
    this.drawSecondCurve();
    this.drawThirdCurve();
    this.drawFourthCurve();
    endShape();
    popMatrix();
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

  void drawThirdCurve() {
    float ellipseCenterX =  this.startX;
    float ellipseCenterY =  this.startY;
    float thetaEnd = PI/2*.97;
    float thetaStart = TWO_PI * 3/4;
    float startingRadius =  this.finalCurveRadius*.97;
    float endingRadius = this.finalCurveRadius*0.822;
    int direction = -1;
    drawCurve(startingRadius, endingRadius, thetaStart, thetaEnd, ellipseCenterX, ellipseCenterY, direction);
  }

  void drawFourthCurve() {
    float ellipseCenterX =  firstCurveCenterRadius * cos(firstCurveCenterDirection) + this.startX*.992;
    float ellipseCenterY =  firstCurveCenterRadius * sin(firstCurveCenterDirection) + this.startY;
    
    float thetaEnd = this.firstCurveCenterDirection + PI;
    float thetaStart = PI / 2;

    int direction = -1;
    float startingRadius = firstCurveCenterRadius*.855;
    float endingRadius = firstCurveCenterRadius*.76;
    drawCurve(startingRadius, endingRadius, thetaStart, thetaEnd, ellipseCenterX, ellipseCenterY, direction);
  }

  void drawCurve(float startingRadius, float endingRadius, float thetaStart, float thetaEnd, float ellipseCenterX, float ellipseCenterY, int direction) {
    float radius = startingRadius;
    float precision = .05;
    float numberOfPoints = (abs((thetaEnd - thetaStart) / precision));
    float radiusIncrement = (endingRadius - startingRadius) / (numberOfPoints / 2);
    
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
      if (direction == 1 && i < numberOfPoints/2) {
        radius += radiusIncrement;
      }
      if (direction != 1 && i > numberOfPoints/2) {
        radius += radiusIncrement;
      }
      this.currentX = x;
      this.currentY = y;
    }
  }
}