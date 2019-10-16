  class Sky {
  //Colour Variables
  color morningColour;
  color currentColour;
  color nightColour;
  color secondaryTransitionColour;
  color sunsetColour;

  float sunriseOpacity;
  float sunsetOpacity;

  boolean sunriseFlag;
  boolean sunsetFlag;

  //Blur Circle
  PGraphics pgTransition;
  
  //Stars
  ArrayList<Star> stars;

  //Constructor
  Sky(color inpMorning, color inpNight, color inpSecondaryTransition, color inpSunset, int noOfStars) {
    morningColour = inpMorning;
    nightColour = inpNight;
    secondaryTransitionColour = inpSecondaryTransition;
    sunsetColour = inpSunset;    


    //pgSunset
    pushMatrix();
    pgTransition = createGraphics(1280, 720, P3D);  
    imageMode(CENTER);
    pgTransition.beginDraw();
    pgTransition.noStroke();
    pgTransition.fill(secondaryTransitionColour);
    pgTransition.ellipse(640, 360, 1280, 720);
    pgTransition.filter(BLUR, 60);
    pgTransition.endDraw();
    popMatrix();
    
    //Instantiate stars
    stars = new ArrayList<Star>();
    for(int i = 0; i < noOfStars; i++){
      instantiateStars();
    }
  }

  //Draw Ground obv  
  void drawSky(int inpHour, int inpMin, boolean drawStars) {
    pushMatrix();
    noStroke();
    fill(currentColour);
    rect(0, 0, width, height);
    popMatrix();
    if (sunsetFlag) {
      pushMatrix();
      tint(255, sunsetOpacity);
      image(pgTransition, 640, 360);
      popMatrix();
    }
    if (sunriseFlag) {
      pushMatrix();
      tint(255, sunriseOpacity);
      image(pgTransition, 640, 360);
      popMatrix();
    }
    
    if(drawStars){
      for(int i = 0; i < stars.size(); i++){
        stars.get(i).drawStar(inpHour, inpMin);
      }
    }
    
  }

  //USING THE AMOUNT OF MINUTES PASSED SINCE 6AM. 
  //If outside 6AM/6PM range, do nothing.
  void calculateSkyColour(int sunMinute) {
    if (sunMinute < 0) {
      currentColour = nightColour;
    } 
    else if (sunMinute >= 0 && sunMinute <= 360) {
      currentColour = lerpColor(nightColour, morningColour, (float)sunMinute/180.0);
      sunriseFlag = true;
      sunsetFlag = false;
      if (sunMinute < 180) {
        sunriseOpacity = (float)sunMinute/100 * 150 + 1;
        println("sunriseOpacity = " + sunriseOpacity);
      } 
      else if (sunMinute >= 180) {
        sunriseOpacity = (float)(180 - (sunMinute-180))/100 * 150 + 1;
      }
    } 
    else if (sunMinute > 360 && sunMinute <= 540) {
      currentColour = lerpColor(morningColour, sunsetColour, (float)(sunMinute - 360)/180.0);
      sunriseFlag = false;
      sunsetFlag = true;
      if (sunMinute < 540) {
        sunsetOpacity = (float)(sunMinute-360)/100 * 150;
      } else if (sunMinute >= 540) {
        sunsetOpacity = (float)(180 - (sunMinute-540))/100 * 150;
      }
    }
    else if(sunMinute > 540){
      currentColour = lerpColor(sunsetColour, nightColour, (float)(sunMinute - 540)/180);
      sunsetFlag = true;
      sunriseFlag = false;
      if (sunMinute < 540) {
        sunsetOpacity = (float)(sunMinute-360)/100 * 150;
      } else if (sunMinute >= 540) {
        sunsetOpacity = (float)(180 - (sunMinute-540))/100 * 150;
      }
    }
  }
  
  void instantiateStars(){
    stars.add( new Star((int)random(0, width), (int)random(0, 240), (int)random(200, 255), (int)random(80, 120), (int)random(2, 4), (int)random(5, 8)));
  }
  
  void destroyStar(){
    stars.remove(stars.size() - 1);
  }
}

