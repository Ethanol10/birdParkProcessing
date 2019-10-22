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
  PGraphics pgTransition2;
  
  //Stars
  ArrayList<Star> stars;
  PImage starImage;

  //Constructor
  Sky(color inpMorning, color inpNight, color inpSecondaryTransition, color inpSunset, int noOfStars) {
    morningColour = inpMorning;
    nightColour = inpNight;
    secondaryTransitionColour = inpSecondaryTransition;
    sunsetColour = inpSunset;   
    
    pushMatrix();
      starImage = loadImage("star.png");
      starImage.resize(15, 15);
      starImage.filter(BLUR, 2);
    popMatrix();

    //pgSunset
    pushMatrix();
    pgTransition = createGraphics(1280, 720, P2D);  
    imageMode(CENTER);
    pgTransition.beginDraw();
    pgTransition.noStroke();
    pgTransition.fill(secondaryTransitionColour);
    pgTransition.ellipse(640, 360, 1280, 720);
    //pgTransition.filter(BLUR, 5);
    pgTransition.endDraw();
    popMatrix();
    
    //2
    pushMatrix();
    pgTransition2 = createGraphics(1280, 720, P2D);  
    imageMode(CENTER);
    pgTransition2.beginDraw();
    pgTransition2.noStroke();
    pgTransition2.fill(secondaryTransitionColour);
    pgTransition2.ellipse(640, 360, 1280, 720);
    pgTransition2.filter(BLUR, 60);
    pgTransition2.endDraw();
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
    imageMode(CENTER);
    fill(currentColour);
    rect(0, 0, width, height);
    popMatrix();
    if (sunsetFlag) {
      
      
      imageMode(CENTER);
      tint(255, sunsetOpacity/2);
      image(pgTransition2, 640, 360);
      
      pushMatrix();
      imageMode(CENTER);
      tint(255, sunsetOpacity/2);
      image(pgTransition, 640, 360);
      popMatrix();
    }
    if (sunriseFlag) {
      imageMode(CENTER);
      tint(255, sunriseOpacity/2);
      image(pgTransition2, 640, 360);
      
      pushMatrix();
      imageMode(CENTER);
      tint(255, sunriseOpacity/2);
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
    if(stars.size() < 200){
      stars.add( new Star((int)random(0, width), (int)random(0, 240), (int)random(200, 255), (int)random(80, 120), (int)random(2, 4), (int)random(5, 8), starImage));
    }
  }
  
  void destroyStar(){
    if(stars.size() > 0){
      stars.remove(stars.size() - 1);
    }
  }
  
  int starDensity(){
    return stars.size();
  }
}

