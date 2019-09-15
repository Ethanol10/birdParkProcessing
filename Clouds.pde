/*
  Class that draws an aggregate of clouds by using Cloud objects. 
  
  This class should take in a density factor and the 
*/
class Clouds{
  int cloudDensity;  
  Cloud[] cloudsArr;
  
  //Constructor
  Clouds(int inpCloudDensity, float shiftSpeed, int maxDepth){
    cloudDensity = inpCloudDensity;
    cloudsArr = new Cloud[cloudDensity];
     
    for(int i = 0; i < cloudsArr.length; i++){
      cloudsArr[i] = new Cloud(shiftSpeed, maxDepth);
    }
  }
  
  //Draw Clouds
  void drawClouds(){
    for(int i = 0; i < cloudsArr.length; i++){
      cloudsArr[i].drawCloud();
    }
  }
}
