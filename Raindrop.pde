class Raindrop{
  int positionX;
  int positionY;
  int endPosY;
  float diameter;
  float speed;
  boolean isAtEnd = false;
  color rainColour;
  
  Raindrop(int inpX, int inpY, float inpSpeed, float inpDiameter, color inpColor){
    positionX = inpX;
    positionY = inpY;
    speed = inpSpeed;
    diameter = inpDiameter;
    rainColour = inpColor;
    endPosY = round(random(positionY, height));
  }
  
  //Update raindrop on every frame
  void drawRaindrop(){
    moveDown();
    pushMatrix();
      noStroke();
      fill(rainColour);
      translate(positionX, positionY);
      ellipse(0, 0, diameter, diameter + 10);
    popMatrix();
    if(isAtEnd){
      refreshDrop();
    }
  }
  
  void debug(){
    println("Hey, the diameter is: " + diameter);
  }
  
  void EOLprocess(){
    
  }
  
  void refreshDrop(){
    positionX = (int)random(width);
    positionY = 0;
    isAtEnd = false;
  }
  
  void moveDown(){
    positionY += speed;
    isAtEnd = checkReachedEnd();
  }
  
  boolean checkReachedEnd(){
    if(positionY >= endPosY){
      return true;
    }
    return false;
  }
  
  
}
