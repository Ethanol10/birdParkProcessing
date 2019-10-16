/*
  Class that draws an aggregate of clouds by using Cloud objects. 
  
  This class should take in a density factor and the populate the top of the canvas
  with clouds. If possible, try to move the clouds away from each other.
*/
class Clouds{
  int cloudDensity;  
  ArrayList <Cloud> cloudsArr;
  float shiftSpeed;
  int maxDepth;
  
  //Constructor
  Clouds(int inpCloudDensity, float inpShiftSpeed, int inpMaxDepth){
    cloudDensity = inpCloudDensity;
    cloudsArr = new ArrayList<Cloud>();
    shiftSpeed = inpShiftSpeed;
    maxDepth = inpMaxDepth;
     
    for(int i = 0; i < cloudDensity; i++){
      increaseCloudDen();
    }
  }
  
  //Draw Clouds
  void drawClouds(){
    for(int i = 0; i < cloudsArr.size(); i++){
      cloudsArr.get(i).drawCloud();
    }
  }
  
  int getCloudDensity(){
    return cloudsArr.size();
  }
  
  void decreaseCloudDen(){
    if(cloudsArr.size() > 0){
      cloudsArr.remove(cloudsArr.size() - 1);    
    }
  }
  
  void increaseCloudDen(){
    if(cloudsArr.size() < 100){
      cloudsArr.add(new Cloud(shiftSpeed, maxDepth, (float)random(0.5,1), (float)random(180, 255)));  
    }
  }
}
