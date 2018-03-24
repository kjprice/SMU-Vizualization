abstract class GraphObject {
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
