

class Flag{
  PImage snow;
  
  Flag() {
  }
  
  private void curve(int currentSecond, int startSecond, float frameCount, float frameRate, float flagSpeed){  
    if(currentSecond==startSecond && frameCount%frameRate==0){
     for (int i = 0; i < countries.length; i++) {
        Country country = countries[i];
        if(country.thisScore!=0){
            country.previousScore=country.thisScore;
          }
        country.thisScore=country.getCurrentScore();
        country.changeScore=country.thisScore-country.previousScore;
        if(country.curveVertexX.size()<=width/25 - 2){//taking array of x positions   25=1500/60 60 - speed flag
          country.curveVertexX.append(int(flagSpeed));
          //y curve position boundary
          if (country.curveFlagPositionY-country.changeScore*7 >= 0 + flagHeight*2){
            country.curveVertexY.append(int(country.curveFlagPositionY-country.changeScore*7));
          }
          //if y of curve goes from the screen, y = 30;
          else{
            country.curveVertexY.append(30);
          }
        }
        //when we got all x positions
        else{
            //remove first y position of the curve
            country.curveVertexY.remove(0);
            //append new last y position of the curve
           if (country.curveFlagPositionY-country.changeScore*7 >= 0 + flagHeight*2){
              country.curveVertexY.append(int(country.curveFlagPositionY-country.changeScore*7));
            }
            //if y of curve goes from the screen, y = 30;
            else{
              country.curveVertexY.append(30);
            }
        }
      }
     flagSpeed+=width / 60;
   }
  }
  
  private void drawFlags() {
    this.curve(currentSecond, startSecond, frameCount, frameRate, flagSpeed);
    snow=loadImage("snow.jpg");
    snow.resize(1500,800);
    background(snow);
    olympicRings();
    for (int i = 0; i < countries.length; i++) {
      Country country = countries[i];
      country.display();
    }
  }
}