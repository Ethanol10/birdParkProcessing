/*
1) A sun should not be drawn at night, during a thunderstorm, or during heavy clouds.
2) Clouds can block sun depending on how many clouds there are. Perhaps create a density value that populates the sky with clouds.
3) Rain can be drawn with clouds, thunderstorm, and/or sun. When getting weather data, scale the rain according to precipitation level.
4) A moon should not be drawn in the morning, afternoon, or during heavy clouds.
5) use https://temboo.com/processing/display-temperature to get weather data. 
*/

class Background{
  //These variables should be either 1 or 0.
  int sunFlag;
  int rainFlag;
  int cloudFlag;
  int thunderFlag;
  int windFlag; //this can be omitted if necessary
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
