
//float barrelsPositionX[];
//float barrelsPositionY[];



void drawBarrels() {  
  if(frameCount % DELAY_BETWEEN_BARRELS == 0) {
  //if(1==1) {
    drawBarrel();
    
  }
}

void drawBarrel() {
    createNewBarrel();
  

}

void createNewBarrel() {
  fill(#9B6605);
    ellipse(barrelStartingPositionX,barrelStartingPositionY,barrelRadius,barrelRadius);
    ellipse(barrelStartingPositionX,barrelStartingPositionY,barrelRadius*0.6,barrelRadius*0.6);
    ellipse(barrelStartingPositionX,barrelStartingPositionY,barrelRadius*0.5,barrelRadius*0.5);
    ellipse(barrelStartingPositionX,barrelStartingPositionY,barrelRadius*0.07,barrelRadius*0.07);
}