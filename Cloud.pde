class Cloud{
  float positionX;
  float positionY;
  float shiftSpeed;
  int maxDepth;
  float scale;
  float opacity;
  
  int cloudWidth = 100; //USE IMAGEWIDTH under PIMAGE when implementing clouds!!!
  
  PImage cloud;
  
  //constructor
  Cloud(float inpShiftSpeed, int inpMaxDepth, float inpScale, float inpOpacity){
    shiftSpeed = inpShiftSpeed;
    maxDepth = inpMaxDepth;
    positionX = round(random(0, width));
    positionY = round(random(0, maxDepth));
    scale = inpScale;
    cloud = loadImage("cloud.png");
    opacity = inpOpacity;
  }
  
  //call every draw loop
  void drawCloud(){
    moveCloud();
    
    pushMatrix();
      imageMode(CORNER);
      tint(255, opacity);
      scale(scale);
      translate(positionX, positionY);
      image(cloud, 0, 0);
    popMatrix();
  }
  
  //moves cloud, should be called with the draw function of this class
  void moveCloud(){
    positionX += shiftSpeed;
    checkPosition();
  }
  
  //check position and move the cloud outside to the otherside of the canvas.
  void checkPosition(){
    if(positionX >= width + (float)cloud.width/scale){//REPLACE WITH PIMAGE WIDTH LATER
      positionX = (0 - cloudWidth*2);
      positionY = round(random(0, maxDepth));
    }  
  }
  
}
