class Background {
  //Weather Objects
  Rain rain;
  Clouds cloud;
  Sun sun;

  //Background Props
  Ground ground;
  Sky sky;

  //Entities
  Entities entityHandler;
  ListHandler listHandler;

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


  Background() {
    jsonWeatherData = loadJSONObject("http://api.openweathermap.org/data/2.5/weather?q=Sydney,AU&appid=93af9bf890724d81ecaa676f91053303&units=metric");
    try { //retrieve rain data from json object
      rainData = jsonWeatherData.getJSONObject("rain");
      rainfallMM = rainData.getFloat("3h");
      println("rainDensity" + rainfallMM);
    }
    catch(Exception e) {
      rainData = null;
      rainfallMM = 0.0;
    }

    try { //retrieve cloud data from json object
      cloudData = jsonWeatherData.getJSONObject("clouds");
      cloudDensity = cloudData.getInt("all");
      println("cloudDensity" + cloudDensity);
    }
    catch(Exception e) {
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
    weatherList.add("Turn on/off rain");
    weatherList.add("Turn on/off clouds");
    weatherList.add("Manual/Auto sun switch");
    listHandler = new ListHandler(weatherList, 50, 50);

    //Rain
    ArrayList<String> rainList = new ArrayList<String>();
    rainList.add("Rain: (" + rain.getRainPrecip() + "mm)");
    rainList.add("Add 10mm rain");
    rainList.add("Add 100mm rain");
    rainList.add("Remove 10mm rain");
    rainList.add("Remove 100mm rain");
    listHandler.addList(rainList);

    //Cloud
    ArrayList<String> cloudList = new ArrayList<String>();
    cloudList.add("Cloud: (" + cloud.getCloudDensity() + "%)");
    cloudList.add("Add 5% cloud");
    cloudList.add("Add 100% cloud");
    cloudList.add("Remove 5% cloud");
    cloudList.add("Remove 100% cloud");
    listHandler.addList(cloudList);
    
    //Time
    ArrayList<String> timeList = new ArrayList<String>();
    timeList.add("Time: (" + sun.currentTime() + ")");
    timeList.add("Add 1 hour");
    timeList.add("Go back 1 hour");
    listHandler.addList(timeList);
    //timeModifiers.add("Time: (" + sun.currentTime() + ")");
  }

  void drawBackground() {
    //Draw Sky
    if (drawSky) {
      sky.calculateSkyColour(sun.calculateMinutes(sun.getCurrentHour(), sun.getCurrentMinute()));
      sky.drawSky();
    }

    //Draw Sun
    if (drawSun) {
      sun.drawSun();
    }

    //Draw Ground
    if (drawGround) {
      ground.calculateGroundColour(sun.calculateMinutes(sun.getCurrentHour(), sun.getCurrentMinute()));
      ground.drawGround();
    }

    //Draw entities
    entityHandler.drawEntities();

    //draw rain
    if (drawRain) {
      rain.drawRain();
      listHandler.lists.get(1).modifyListHeader("Rain: (" + rain.getRainPrecip() + "mm)");
    }

    //Draw clouds
    if (drawCloud) {
      //draw Clouds
      cloud.drawClouds();
      listHandler.lists.get(2).modifyListHeader("Cloud: (" + cloud.getCloudDensity() + "%)");
    }

    //Draw Thunder
    if (drawThunder) {
      //draw Thunder
    }

    //DrawUI
    listHandler.lists.get(3).modifyListHeader("Time: (" + sun.currentTime() + ")");   
    listHandler.drawLists();

    //Draw Instructions
    if (drawInstructions) {
      pushMatrix();
      fill(255, 255, 255);
      String s = "Press 'c' to draw clouds \nPress 'r' to draw rain \nPress 't' to draw thunder \nPress 's' to draw the sun \nPress 'a' to automate the sun movement \nPress '[' to move time back \nPress ']' to move time forward \nPress '=' to increase rain precipitation \nPress '-' to decrease rain precipitation \nPress 'i' to open and close these instructions";
      String s2 = "\nCurrent Rainfall: " + rain.getRainPrecip() + "mm";
      String s3 = "\nCurrent Cloud density: " + cloud.getCloudDensity() + "%";
      String s4 = "\nCurrent Time: " + sun.currentTime();
      String s5 = "\nAuto mode Active?: " + sun.autoSunMovement;

      text(s + s2 + s3 + s4 + s5, 10, 20);     
      popMatrix();
    }
  }

  void mouseClickedBackground() {
    String uiClicked = listHandler.checkCollision();
    
    //do stuff based on what string they clicked.
    //WEATHER
    if(uiClicked == "Turn on/off rain"){
      //switch rain
      setRain();
    }
    else if(uiClicked == "Turn on/off clouds"){
      setClouds();  
    }
    else if(uiClicked == "Manual/Auto sun switch"){
      autoSun();
    }
    
    //RAIN
    else if(uiClicked == "Add 10mm rain"){
      for(int i = 0; i < 10; i++){
        increaseRain();
      }
    }
    else if(uiClicked == "Add 100mm rain"){
      for(int i = 0; i < 100; i++){
        increaseRain();  
      }
    }
    else if(uiClicked == "Remove 10mm rain"){
      for(int i = 0; i < 10; i++){
        decreaseRain(); 
      }
    }
    else if(uiClicked == "Remove 100mm rain"){
      for(int i = 0; i < 100; i++){
        decreaseRain();  
      }
    }
    
    //Clouds
    else if(uiClicked == "Add 5% cloud"){
      for(int i = 0; i < 5; i++){
        increaseCloud();
      }
    }
    else if(uiClicked == "Add 100% cloud"){
      for(int i = 0; i < 100; i++){
        increaseCloud();
      }
    }
    else if(uiClicked == "Remove 5% cloud"){
      for(int i = 0; i < 5; i++){
        decreaseCloud();
      }
    }
    else if(uiClicked == "Remove 100% cloud"){
      for(int i = 0; i < 100; i++){
        decreaseCloud();
      }
    }
    
    //Timer
    else if(uiClicked == "Add 1 hour"){
      for(int i = 0; i < 60; i++){
        moveSunForward();    
        listHandler.lists.get(3).modifyListHeader("Time: (" + sun.currentTime() + ")");
      }
    }
    else if(uiClicked == "Go back 1 hour"){
      for(int i = 0; i < 60; i++){
        moveSunBackward(); 
      }
    }
  }

  void setRain() {
    drawRain = !drawRain;
  }
  void setClouds() {
    drawCloud = !drawCloud;
  }
  void setThunder() {
    drawThunder = !drawThunder;
  }
  void setInstructions() {
    drawInstructions = !drawInstructions;
  }
  void setSun() {
    drawSun = !drawSun;
  }
  void setGround() {
    drawGround = !drawGround;
  }
  void increaseRain() {
    rain.increaseRainPrecip();
  }
  void decreaseRain() {
    rain.decreaseRainPrecip();
  }
  void increaseCloud(){
    cloud.increaseCloudDen();
  }
  void decreaseCloud(){
    cloud.decreaseCloudDen();
  }
  void moveSunForward() {
    sun.sunForward();
  }
  void moveSunBackward() {
    sun.sunBack();
  }
  void autoSun() {
    sun.setAutoSun();
  }
}

