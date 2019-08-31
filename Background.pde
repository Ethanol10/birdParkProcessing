class Background{
  //These variables should be either 1 or 0.
  int sunFlag;
  int rainFlag;
  int cloudFlag;
  int thunderFlag;
  int moonFlag;
  
  //should be set to a value 0 to 2. 0 morning, 1 afternoon, 2 night
  int dayNightFlag; 
  Background(){
  
  }
  
  //Call this to draw the background. In this function, figure out what to draw and call
  //the appropriate function to draw the right weather type. i.e: call the drawSun()
  //function if you're drawing a sun
  void drawBackground(){
    
  }
    
  //draw a sun
  void drawSun(){
    
  }
  
  //Draw clouds
  void drawClouds(){
  
  }
  
  //Draw rain
  void drawRain(){
  
  }
  
  //Draw thunder
  //thunder should only be drawn for a fraction of a second, simulating a thunderstorm.
  //use an animation counter.
  void drawThunder(){
    
  }
  
  //choose the colours to reflect the time of day
  void drawTimeOfDay(){
  
  }
}
