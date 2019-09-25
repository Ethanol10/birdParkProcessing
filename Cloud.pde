class Cloud{
  float positionX;
  float positionY;
  float shiftSpeed;
  int maxDepth;
  
  int cloudWidth = 100; //USE IMAGEWIDTH under PIMAGE when implementing clouds!!!
  
  //constructor
  Cloud(float inpShiftSpeed, int inpMaxDepth){
    shiftSpeed = inpShiftSpeed;
    maxDepth = inpMaxDepth;
    positionX = round(random(0, width));
    positionY = round(random(0, maxDepth));
  }
  
  //call every draw loop
  void drawCloud(){
    moveCloud();
    
    pushMatrix();
      fill(100,100,100, 150);
      noStroke();
      translate(positionX, positionY);
      rect(0, 0, 150, 100);
    popMatrix();
  }
  
  //moves cloud, should be called with the draw function of this class
  void moveCloud(){
    positionX += shiftSpeed;
    checkPosition();
  }
  
  //check position and move the cloud outside to the otherside of the canvas.
  void checkPosition(){
    if(positionX >= width + cloudWidth){//REPLACE WITH PIMAGE WIDTH LATER
      positionX = (0 - cloudWidth*2);
      positionY = round(random(0, maxDepth));
    }  
  }
  
}
