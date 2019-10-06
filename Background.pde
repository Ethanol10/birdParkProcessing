class Background{
  //Weather Objects
  Rain rain;
  Clouds cloud;
  Sun sun;
  
  //Background Props
  Ground ground;
  Sky sky;
  
  //Entities
  Entities entityHandler;
  UIList weatherButtons;
  
  //JSON objects
  JSONObject jsonWeatherData;
  JSONObject rainData;
  JSONObject cloudData;
  
  //Object Flags
  boolean drawRain = true;
  boolean drawCloud = true;
  boolean drawThunder = true;
  boolean drawInstructions = false;
  boolean drawSun = true;
  boolean drawGround = true;
  boolean drawSky = true;
  
  //Other Vars
  int cloudDensity;
  float rainfallMM;

  
  Background(){
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
    
    //Prepare objects
    rain = new Rain((int)rainfallMM, 240, 30, 60);
    cloud = new Clouds(cloudDensity, 0.2, 100);
    sun = new Sun(240, 150);
    ground = new Ground(0, 240, color(133, 168, 74), color(1, 50, 32));
    sky = new Sky(color(135, 206, 235), color(15, 15, 66), color(255, 149, 6), color(255, 97, 100));
    entityHandler = new Entities();
    
    //UILIST stuff
    ArrayList<String> weatherList = new ArrayList<String>();
    weatherList.add("Weather");
    weatherList.add("Add 10mm rain");
    weatherList.add("Remove 10mm rain");
    weatherList.add("Add 2% cloud");
    weatherList.add("Remove 2% cloud");
    weatherList.add("Manual/Auto sun switch");
    weatherButtons = new UIList(weatherList, 50, 50);
  }
  
  void drawBackground(){
    //Draw Sky
    if(drawSky){
      sky.calculateSkyColour(sun.calculateMinutes(sun.getCurrentHour(), sun.getCurrentMinute()));
      sky.drawSky();
    }
    
    //Draw Sun
    if(drawSun){
      sun.drawSun();
    }
    
    //Draw Ground
    if(drawGround){
      ground.calculateGroundColour(sun.calculateMinutes(sun.getCurrentHour(), sun.getCurrentMinute()));
      ground.drawGround();
    }
    
    //Draw entities
    entityHandler.drawEntities();
    
    //draw rain
    if(drawRain){
      rain.drawRain();
    }
    
    //Draw clouds
    if(drawCloud){
      //draw Clouds
      cloud.drawClouds();
    }
    
    //Draw Thunder
    if(drawThunder){
      //draw Thunder
    }
    
    
    weatherButtons.drawUIList();
    //Draw Instructions
    if(drawInstructions){
      pushMatrix();
        fill(255,255,255);
        String s = "Press 'c' to draw clouds \nPress 'r' to draw rain \nPress 't' to draw thunder \nPress 's' to draw the sun \nPress 'a' to automate the sun movement \nPress '[' to move time back \nPress ']' to move time forward \nPress '=' to increase rain precipitation \nPress '-' to decrease rain precipitation \nPress 'i' to open and close these instructions";
        String s2 = "\nCurrent Rainfall: " + rain.getRainPrecip() + "mm";
        String s3 = "\nCurrent Cloud density: " + cloud.getCloudDensity() + "%";
        String s4 = "\nCurrent Time: " + sun.currentTime();
        String s5 = "\nAuto mode Active?: " + sun.autoSunMovement;
         
        text(s + s2 + s3 + s4 + s5, 10, 20);     
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
  void setSun(){
    drawSun = !drawSun;
  }
  void setGround(){
    drawGround = !drawGround;
  }
  void increaseRain(){
    rain.increaseRainPrecip();
    cloud.increaseCloudDen();
  }
  void decreaseRain(){
    rain.decreaseRainPrecip();
    cloud.decreaseCloudDen();
  }
  void moveSunForward(){
    sun.sunForward();
  }
  void moveSunBackward(){
    sun.sunBack();
  }
  void autoSun(){
    sun.setAutoSun();
  }
}
