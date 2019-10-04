class Sky{
  //Colour Variables
  color morningColour;
  color currentColour;
  color nightColour;
  color sunsetColour;
  color sunriseColour;
  
  float sunriseOpacity;
  float sunsetOpacity;
  
  boolean sunriseFlag;
  boolean sunsetFlag
  
  //Blur Circle
  PGraphics pg;  
  
  //Constructor
  Sky(color inpMorning, color inpNight, color inpSunset, color inpSunrise){
    morningColour = inpMorning;
    nightColour = inpNight;
    sunsetColour = inpSunset;
    sunriseColour = inpSunrise
    
    pg = createGraphics(720, 720, P3D);
  }

  //Draw Ground obv  
  void drawSky(){
    pushMatrix();
      noStroke();
      fill(currentColour);
      rect(0, 0, width, height);
    popMatrix();
    if(sunsetFlag){
      pg.beginDraw();
      pg.noStroke();
      pg.fill(sunsetColour, sunsetOpacity);
      pg.ellipse(100,100,100,100);
      pg.filter(BLUR, 6);
      pg.endDraw();
      image(pg, 0, 0);
    }
  }
  
  //USING THE AMOUNT OF MINUTES PASSED SINCE 6AM. 
  //If outside 6AM/6PM range, do nothing.
  void calculateSkyColour(int sunMinute){
    if(sunMinute < 0){
      currentColour = nightColour;
    }
    else if(sunMinute >= 0 && sunMinute <= 360){
      currentColour = lerpColor(nightColour, morningColour, (float)sunMinute/180.0;
      sunriseFlag = true;
      sunsetFlag = false;
      sunriseOpacity = sunMinute/100 * 255; 
    }
    else if(sunMinute > 360){
      currentColour = lerpColor(sunsetColour, nightColour, (float)(sunMinute - 360)/360.0);
      sunriseFlag = false;
      sunsetFlag = true;
    }
  }
}
