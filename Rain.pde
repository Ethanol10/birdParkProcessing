/*
  Class that handles rain with raindrops as aggregate objects.
    
  This class should handle the rain and how much precipitation should be drawn on screen
  The constructor sets an amount of precipitation based on an input variable, which has three,
  layers of rain that differ in colour to simulate a depth of field in the rain.
*/
class Rain{
  int rainPrecipitation;
  float minSpeed;
  float maxSpeed;
  int lTermPoint;
  ArrayList<Raindrop> bigRaindrop;
  ArrayList<Raindrop> mediumRaindrop;

  Rain(int inputPrecip, int inpLTermPoint, float inpMinSpeed, float inpMaxSpeed){
    rainPrecipitation = inputPrecip; 
    bigRaindrop = new ArrayList<Raindrop>(); 
    mediumRaindrop = new ArrayList<Raindrop>();
    minSpeed = inpMinSpeed;
    maxSpeed = inpMaxSpeed;
    lTermPoint = inpLTermPoint;
    
    for(int i = 0; i < rainPrecipitation; i++){
      increaseRainPrecip();
    }
  }
  
  //Raindrop
  void drawRain(){
    for(int i = 0; i < bigRaindrop.size(); i++){
      bigRaindrop.get(i).drawRaindrop();
    }
    for(int i = 0; i < mediumRaindrop.size(); i++){
      mediumRaindrop.get(i).drawRaindrop();
    }
  }
  
  void decreaseRainPrecip(){
    if(bigRaindrop.size() > 0){
      bigRaindrop.remove(bigRaindrop.size() - 1);
      mediumRaindrop.remove(mediumRaindrop.size() - 1);
    }
  }
  
  void increaseRainPrecip(){
    bigRaindrop.add(new Raindrop((int)random(width), (int)random(height), 
        (float)round(random(minSpeed, maxSpeed)), 2.0, color(135,206,250), lTermPoint));
      
    mediumRaindrop.add(new Raindrop((int)random(width), (int)random(height),
        (float)round(random(minSpeed, maxSpeed)), 1.0, color(0,191,255), lTermPoint));
  }
  
  int getRainPrecip(){
    return bigRaindrop.size();
  }
}
