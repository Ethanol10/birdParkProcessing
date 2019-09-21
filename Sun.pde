/*
  This class is relatively simple, should just be drawing the sun in a position relative to the current time. The sun rises from the 
  east to the west, so east earlier in the morning, west later in the afternoon.
*/

class Sun{
  //Position variables
  float xPos;
  float yPos;
  
  //Sun size
  float sunRadius = 100;
  
  //Sun position limiters
  int sunBaseline;
  int sunRaiseHeight;
  
  //Angle to use for calculating height.
  float sunAngle;
  
  //trigger drawing sun
  boolean sunActive;
  boolean autoSunMovement;
  
  //time var
  int manualHour;
  int manualMinute;
  
  Sun(int inpBaseline, int inpRaiseHeight){
    sunBaseline = inpBaseline;
    sunRaiseHeight = inpRaiseHeight;
    autoSunMovement = true;
  }
  
  void drawSun(){
    if(autoSunMovement){
      autoSetSunPosition();
    }
    else{
      manualSetSunPosition();
    }
    
    if(sunActive){
      pushMatrix();
        fill(255,255,0);
        noStroke();
        translate(xPos, yPos);
        ellipse(0, 0, sunRadius, sunRadius);
      popMatrix();
    }
  }
  
  //Calculate and set the position for the sun
  void autoSetSunPosition(){
    int currentMinute = calculateMinutes(hour(), minute());
    manualHour = hour();
    manualMinute = minute();
    
    if(currentMinute != -1){
      sunActive = true;
      sunAngle = currentMinute / 4;
      yPos = sunBaseline - sin(radians(sunAngle)) * sunRaiseHeight;
      xPos = width * ((float)currentMinute / 780);
      println("xpos: " + xPos);
      println("ypos: " + yPos);
      println("currentMinute: " + currentMinute);
      return;  
    }
    
    sunActive = false;
  }
  
  void manualSetSunPosition(){
    int currentMinute = calculateMinutes(manualHour, manualMinute);
    if(currentMinute != -1){
      sunActive = true;
      sunAngle = currentMinute / 4;
      yPos = sunBaseline - sin(radians(sunAngle)) * sunRaiseHeight;
      xPos = width * ((float)currentMinute / 720) - 30;
      println("xpos: " + xPos);
      println("ypos: " + yPos);
      println("currentMinute: " + currentMinute);
      return;  
    }
    
    sunActive = false;
  }
  
  //Calculate minutes from 6AM to 6PM, return -1 if outside of those times.<---
  int calculateMinutes(int inpHour, int inpMinute){
    int totalMinutes = 0;
    
    if( (inpHour >= 5) && (inpHour <= 19) ){
      totalMinutes += (inpHour - 6) * 60;   
      totalMinutes += inpMinute;
      return totalMinutes;
    }
    return -1;
  }
  
  //Changes whether if the sun should be drawn at the right position in the sky.
  void setAutoSun(){
    autoSunMovement = !autoSunMovement;
    println("current Sun set to: " + autoSunMovement);
  }
  
  void sunForward(){
    manualMinute++;
    if(manualMinute >= 60){
      manualHour++;
      manualMinute = 0;
    }
    
    if(manualHour >= 24){
      manualHour = 0;
    }
  }
  
  void sunBack(){
    manualMinute--;
    if(manualMinute < 0){
      manualHour--;
      manualMinute = 59;
    }
    
    if(manualHour <= 0){
      manualHour = 23;
    }
  } 
  
  String currentTime(){
    if(manualMinute >= 0 && manualMinute < 10){
      return manualHour + ":0" + manualMinute;
    }
    return manualHour + ":" + manualMinute;
  }
}
