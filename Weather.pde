class Weather{
  Rain rain;
  Clouds cloud;
  int cloudDensity;
  float rainfallMM;
  JSONObject jsonWeatherData;
  JSONObject rainData;
  JSONObject cloudData;
  boolean drawRain = true;
  boolean drawCloud = true;
  boolean drawThunder = true;
  boolean drawInstructions = true;
  
  Weather(){
    jsonWeatherData = loadJSONObject("http://api.openweathermap.org/data/2.5/weather?q=Sydney,AU&appid=93af9bf890724d81ecaa676f91053303&units=metric");
    try{ //retrieve rain data from json object
      rainData = jsonWeatherData.getJSONObject("rain");
      rainfallMM = rainData.getFloat("3h");
      println("rainDensity" + rainfallMM);
    }
    catch(Exception e){
      rainData = null;
      rainfallMM = 0.0;
    }
   
    try{ //retrieve cloud data from json object
      cloudData = jsonWeatherData.getJSONObject("clouds");
      cloudDensity = cloudData.getInt("all");
      println("cloudDensity" + cloudDensity);
    }
    catch(Exception e){
      cloudData = null;
      cloudDensity = 2;
    }
    
    //Testing purposes only! Weather should only be spawned in the Background class.
    rain = new Rain((int)rainfallMM, 500, 10, 20);
    cloud = new Clouds(cloudDensity, 0.2, 150);
  }
  
  void drawWeather(){
    if(drawCloud){
      //draw Clouds
      cloud.drawClouds();
    }
    //draw rain
    if(drawRain){
      rain.drawRain();
    }
    if(drawThunder){
      //draw Thunder
    }
    if(drawInstructions){
      pushMatrix();
        fill(255,255,255);
        String s = "Press 'c' to draw clouds \nPress 'r' to draw rain \nPress 't' to draw thunder \nPress '=' to increase rain precipitation \nPress '-' to decrease rain precipitation \nPress 'i' to open and close these instructions";
        String s2 = "\nCurrent Rainfall: " + rain.getRainPrecip() + "mm";
        String s3 = "\nCurrent Cloud density: " + cloud.getCloudDensity() + "%";
         
        text(s + s2 + s3, 10, 20);     
      popMatrix();
    }
  }
  
  void setRain(){
    drawRain = !drawRain;
  }
  void setClouds(){
    drawCloud = !drawCloud;
  }
  void setThunder(){
    drawThunder = !drawThunder;
  }
  void setInstructions(){
    drawInstructions = !drawInstructions;
  }
  void increaseRain(){
    rain.increaseRainPrecip();
  }
  void decreaseRain(){
    rain.decreaseRainPrecip();
  }
}
