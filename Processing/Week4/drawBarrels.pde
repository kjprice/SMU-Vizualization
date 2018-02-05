

void drawBarrel() {  
    fill(#9B6605);
    ellipse(x,y,barrelRadius,barrelRadius);
    ellipse(x,y,barrelRadius*0.6,barrelRadius*0.6);
    ellipse(x,y,barrelRadius*0.5,barrelRadius*0.5);
    ellipse(x,y,barrelRadius*0.07,barrelRadius*0.07);  
}


void collideBarrelSlope() {
  if (y < slopePositionStartY-barrelRadius/2) {
    y += spdY;
  }
  else if ((y >  slopePositionStartY-barrelRadius/2) && (x > slopePositionStartX - 15 )) { 
      x -= spdX;
  }
  else { 
      x -= spdX;
      y += spdY;
  }  
 }


void collideBarrelChar() {
   if (( abs(characterPositionX + characterWidth - x) < barrelRadius/2) && ( abs(characterPositionY + characterHeight/2 - y) < barrelRadius/2)  ) {  
     gameOverFail = true;
  }  
}