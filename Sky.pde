class Sky{
  //Colour Variables
  color morningColour;
  color currentColour;
  color nightColour;
  
  //Constructor
  Sky(color inpMorning, color inpNight){
    morningColour = inpMorning;
    nightColour = inpNight;
  }

  //Draw Ground obv  
  void drawSky(){
    pushMatrix();
      noStroke();
      fill(currentColour);
      rect(0, 0, width, height);
    popMatrix();
  }
  
  //USING THE AMOUNT OF MINUTES PASSED SINCE 6AM. 
  //If outside 6AM/6PM range, do nothing.
  void calculateSkyColour(int sunMinute){
    if(sunMinute < 0){
      currentColour = nightColour;
    }
    else if(sunMinute >= 0 && sunMinute <= 360){
      currentColour = lerpColor(nightColour, morningColour, (float)sunMinute/360.0);
    }
    else if(sunMinute > 360){
      currentColour = lerpColor(morningColour, nightColour, (float)(sunMinute - 360)/360.0);
    }
  }
}
