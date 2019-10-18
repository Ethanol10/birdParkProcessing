class Ground{
  //Colour Variables
  color groundColour;
  color currentColour;
  color nightGroundColour;
  
  //Positioning and size
  int posX;
  int posY;
  
  PImage groundProps;

  //Constructor
  Ground(int inpX, int inpY, color inpGround, color inpNight){
    posX = inpX;
    posY = inpY;
    groundColour = inpGround;
    nightGroundColour = inpNight;
    groundProps = loadImage("backgroundProps.png");
  }

  //Draw Ground obv  
  void drawGround(){
    pushMatrix();
      imageMode(CORNER);
      noStroke();
      tint(255, 255);
      fill(currentColour);
      rect(posX, posY, width, height);
      image(groundProps, 0, 1);
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
