/*
  Raindrops are spawned on a random position within a 2D plane. These raindrops have a termination point
  and these will despawn at a random position on the screen. 
  
  When these poitns hit the termination point, they should instead draw a circle that expands fast over a 
  small radius to simulate raindrop impact on a hard surface. 
*/
class Raindrop{
  //Raindrop variables
  int positionX;
  int positionY;
  int endPosY;
  float diameter;
  float speed;
  boolean isAtEnd = false;
  color rainColour;
  int lTermPoint = 500; //Lowest termination point
 
  //Puddle Variables
  float currentDiameterPuddle = 0;
  float maxDiameterPuddle = 30;
  float gapStart = random(0, 360);
  float gapEnd;
  float angleDrawn = 300;
  
  //Constructor, Initialise variables
  Raindrop(int inpX, int inpY, float inpSpeed, float inpDiameter, color inpColor){
    positionX = inpX;
    positionY = inpY;
    speed = inpSpeed;
    diameter = inpDiameter;
    rainColour = inpColor;
    endPosY = round(random(lTermPoint, height));
    gapEnd = gapStart + angleDrawn;
  }
  
  //Update raindrop on every frame
  void drawRaindrop(){
    if(isAtEnd){ //Draw splash puddle
      drawSplash();
    }
    else{ //Draw Raindrop
      moveDown();
      pushMatrix();
        noStroke();
        fill(rainColour, 127.5);
        translate(positionX, positionY);
        ellipse(0, 0, diameter, diameter + 10);
      popMatrix();
    }
  }
  
  //Only draw when the raindrop has hit the termination point.
  void drawSplash(){  
    pushMatrix();
      noFill();
      stroke(rainColour, 255 - (currentDiameterPuddle * 6));
      strokeWeight(1);
      translate(positionX, positionY);
      if(gapStart < gapEnd){
        arc(0, 0, currentDiameterPuddle, (float)currentDiameterPuddle/4, radians(gapStart), radians(gapEnd));     
      } 
      else{
        arc(0, 0, currentDiameterPuddle, (float)currentDiameterPuddle/4, radians(gapEnd), radians(gapStart));     
      }
    popMatrix();
    updateSplash();
  }
  
  //Update to increase radius of circle, and stop drawing when circle has reach max size.
  void updateSplash(){
    currentDiameterPuddle += 2;
    if(currentDiameterPuddle > maxDiameterPuddle){
      refreshDrop();
    }
  }
  
  //When all processes are done, refresh the drop to fall again.
  void refreshDrop(){
    positionX = (int)random(width);
    positionY = 0;
    endPosY = round(random(lTermPoint, height));
    isAtEnd = false;
    gapStart = random(0, 360);
    gapEnd = gapStart + angleDrawn;
    currentDiameterPuddle = 0;
  }
  
  //Move the raindrop down the screen
  void moveDown(){
    positionY += speed;
    isAtEnd = checkReachedEnd();
  }
  
  //Return a bool to check if the drop has reached termination point.
  boolean checkReachedEnd(){
    if(positionY >= endPosY){
      return true;
    }
    return false;
  }
  
  
}
