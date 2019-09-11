/*
  This class should handle the rain and how much precipitation should be drawn on screen
  The constructor sets an amount of precipitation based on an input variable, which has three,
  layers of rain that differ in colour to simulate a depth of field in the rain.
*/
class Rain{
  int rainPrecipitation;
  Raindrop[] bigRaindrop;
  Raindrop[] mediumRaindrop;

  Rain(int inputPrecip){
    rainPrecipitation = inputPrecip; 
    bigRaindrop = new Raindrop[rainPrecipitation]; 
    mediumRaindrop = new Raindrop[rainPrecipitation];
    
    //Initialise the raindrops
    for(int i = 0; i < bigRaindrop.length; i++){
      bigRaindrop[i] = new Raindrop((int)random(width), (int)random(height), 
        (float)round(random(7, 15)), 2.0, color(135,206,250));
    }
    for(int i = 0; i < mediumRaindrop.length; i++){
      mediumRaindrop[i] = new Raindrop((int)random(width), (int)random(height),
        (float)round(random(7, 10)), 1.0, color(0,191,255));
    }
  }
  
  //Raindrop
  void drawRain(){
    for(int i = 0; i < bigRaindrop.length; i++){
      bigRaindrop[i].drawRaindrop();
    }
    for(int i = 0; i < mediumRaindrop.length; i++){
      mediumRaindrop[i].drawRaindrop();
    }
  }
}
