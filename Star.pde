class Star {
  int xPos;
  int yPos;

  //Opacity variable
  float currentOpacity; //vary between two values, but don't go invisible.
  float opacityDelta; //randomly generate to appear like it's blinking
  float upperOpacity; //Upper limit of opacity
  float lowerOpacity; //Lower limit of opacity
  float targetOpacity;
  float minDelta;
  float maxDelta;

  //Pimage
  PImage starImg;

  Star(int inpX, int inpY, int inpUOpacity, int inpLOpacity, float inpMinDelta, float inpMaxDelta, PImage inpStarImg) {
    xPos = inpX;
    yPos = inpY;
    starImg = inpStarImg;
    minDelta = inpMinDelta;
    maxDelta = inpMaxDelta;
    opacityDelta = (float)round(random(minDelta, maxDelta));
    upperOpacity = inpUOpacity;
    lowerOpacity = inpLOpacity;
    targetOpacity = (float)round(random(upperOpacity, lowerOpacity));
  }

  void drawStar(int inpHour, int inpMin) {
    pushMatrix();
      setOpacity(inpHour, inpMin);
      imageMode(CENTER);
      tint(255, currentOpacity);
      image(starImg, xPos, yPos);
    popMatrix();
  }

  void setOpacity(int inpHour, int inpMin) {
    if(inpHour > 5 && inpHour < 19){
      if(currentOpacity > 0){
        currentOpacity -= opacityDelta;
        if(currentOpacity < 0){
          currentOpacity = 0;
        }
      }  
    }
    else{
      if(currentOpacity <= targetOpacity){
        currentOpacity += opacityDelta;
        if(currentOpacity >= targetOpacity){
          opacityDelta = (float)round(random(minDelta, maxDelta));
          targetOpacity = (float)round(random(lowerOpacity, upperOpacity));
        }
      }
      else if(currentOpacity >= targetOpacity){
        currentOpacity -= opacityDelta;
        if(currentOpacity <= targetOpacity){
          opacityDelta = (float)round(random(minDelta, maxDelta));
          targetOpacity = (float)round(random(lowerOpacity, upperOpacity));
        }
      }
    }
  }
}

