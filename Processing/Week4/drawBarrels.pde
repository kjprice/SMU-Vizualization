
float barrelsPositionX[];
float barrelsPositionY[];



void drawBarrels() {
  if(frameCount % DELAY_BETWEEN_BARRELS == 0) {
    ellipse(barrelStartingPositionX,barrelStartingPositionY,barrelRadius*1,barrelRadius*1);
    ellipse(barrelStartingPositionX,barrelStartingPositionY,barrelRadius*0.6,barrelRadius*0.6);
    ellipse(barrelStartingPositionX,barrelStartingPositionY,barrelRadius*0.5,barrelRadius*0.5);
    
  }
}

void drawBarrel() {
  
  
}

void createNewBarrel() {
}