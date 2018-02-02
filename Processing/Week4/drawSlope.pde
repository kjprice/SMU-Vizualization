void drawSlope() {  
  line(slopePositionStartX, slopePositionStartY, slopePositionEndX, slopePositionEndY);
}

boolean characterBetweenSlopeY() {
  return characterHeight + characterPositionY > slopePositionEndY
    && characterPositionY < slopePositionEndY;
}

boolean characterAboveAndInsideSlope() {
  return characterBetweenSlopeY()
    && characterBetweenSlopeX();
}

boolean characterBetweenSlopeX() {
  return (characterPositionX + maxCharacterWidth) > slopePositionStartX
   && characterPositionX < slopePositionEndX;
}