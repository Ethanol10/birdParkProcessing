class Ground{
  //Colour Variables
  color groundColour;
  color currentColour;
  color nightGroundColour;
  
  //Positioning and size
  int posX;
  int posY;

  //Constructor
  Ground(int inpX, int inpY, color inpGround, color inpNight){
    posX = inpX;
    posY = inpY;
    groundColour = inpGround;
    nightGroundColour = inpNight;
  }

  //Draw Ground obv  
  void drawGround(){
    pushMatrix();
      noStroke();
      fill(currentColour);
      rect(posX, posY, width, height);
    popMatrix();
  }
  
  //USING THE AMOUNT OF MINUTES PASSED SINCE 6AM. 
  //If outside 6AM/6PM range, do nothing.
  void calculateGroundColour(int sunMinute){
    if(sunMinute < 0){
      currentColour = nightGroundColour;
    }
    else if(sunMinute >= 0 && sunMinute <= 360){
      currentColour = lerpColor(nightGroundColour, groundColour, (float)sunMinute/360.0);
    }
    else if(sunMinute > 360){
      currentColour = lerpColor(groundColour, nightGroundColour, (float)(sunMinute - 360)/360.0);
    }
  }
}
