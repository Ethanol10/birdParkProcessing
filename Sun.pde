/*
  This class is relatively simple, should just be drawing the sun in a position relative to the current time. The sun rises from the 
 east to the west, so east earlier in the morning, west later in the afternoon.
 */

class Sun {
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
  //It's safe to use these to refer to the current time as these are updated even in auto mode.
  int manualHour;
  int manualMinute;

  //PGraphics
  PGraphics sunPG;
  PGraphics outline;

  Sun(int inpBaseline, int inpRaiseHeight) {
    sunBaseline = inpBaseline;
    sunRaiseHeight = inpRaiseHeight;
    autoSunMovement = true;

    pushMatrix();
    sunPG = createGraphics((int)sunRadius * 2, (int)sunRadius * 2, P3D);  
    sunPG.beginDraw();
    sunPG.stroke(255);
    sunPG.strokeWeight(4);
    sunPG.fill(255, 255, 0);
    sunPG.ellipse(sunRadius, sunRadius, sunRadius, sunRadius);
    sunPG.filter(BLUR, 2);
    sunPG.endDraw();
    popMatrix();
    
    pushMatrix();
    outline = createGraphics((int)sunRadius*2, (int)sunRadius * 2, P3D);
    outline.beginDraw();
    outline.stroke(255);
    outline.strokeWeight(4);
    outline.noFill();
    outline.ellipse(sunRadius, sunRadius, sunRadius, sunRadius);
    outline.endDraw();
    outline.filter(BLUR, 1);
    popMatrix();
  }

  void drawSun() {
    if (autoSunMovement) {
      autoSetSunPosition();
    } else {
      manualSetSunPosition();
    }

    if (sunActive) {
      pushMatrix();
      tint(255, 255);
      imageMode(CENTER);
      image(outline, xPos, yPos);
      image(sunPG, xPos, yPos);
      popMatrix();
    }
  }

  //Calculate and set the position for the sun
  void autoSetSunPosition() {
    int currentMinute = calculateMinutes(hour(), minute());
    manualHour = hour();
    manualMinute = minute();

    if (currentMinute != -1) {
      sunActive = true;
      sunAngle = currentMinute / 4;
      yPos = sunBaseline - sin(radians(sunAngle)) * sunRaiseHeight;
      xPos = width * ((float)currentMinute / 780);
      //      println("xpos: " + xPos);
      //      println("ypos: " + yPos);
      //      println("currentMinute: " + currentMinute);
      return;
    }

    sunActive = false;
  }

  void manualSetSunPosition() {
    int currentMinute = calculateMinutes(manualHour, manualMinute);
    if (currentMinute != -1) {
      sunActive = true;
      sunAngle = currentMinute / 4;
      yPos = sunBaseline - sin(radians(sunAngle)) * sunRaiseHeight;
      xPos = width * ((float)currentMinute / 720) - 30;
      //      println("xpos: " + xPos);
      //      println("ypos: " + yPos);
      //      println("currentMinute: " + currentMinute);
      return;
    }

    sunActive = false;
  }

  //Calculate minutes from 6AM to 6PM, return -1 if outside of those times.<---
  int calculateMinutes(int inpHour, int inpMinute) {
    int totalMinutes = 0;

    if ( (inpHour >= 5) && (inpHour <= 19) ) {
      totalMinutes += (inpHour - 6) * 60;   
      totalMinutes += inpMinute;
      return totalMinutes;
    }
    return -1;
  }

  //Changes whether if the sun should be drawn at the right position in the sky.
  void setAutoSun() {
    autoSunMovement = !autoSunMovement;
    println("current Sun set to: " + autoSunMovement);
  }
  
  boolean isAutoSun(){
    return autoSunMovement;
  }

  void sunForward() {
    manualMinute++;
    if (manualMinute >= 60) {
      manualHour++;
      manualMinute = 0;
    }

    if (manualHour >= 24) {
      manualHour = 0;
    }
  }

  void sunBack() {
    manualMinute--;
    if (manualMinute < 0) {
      manualHour--;
      manualMinute = 59;
    }

    if (manualHour < 0) {
      manualHour = 23;
      manualMinute = 59;
    }
  } 

  String currentTime() {
    if (manualMinute >= 0 && manualMinute < 10) {
      return manualHour + ":0" + manualMinute;
    }
    return manualHour + ":" + manualMinute;
  }

  int getCurrentHour() {
    return manualHour;
  }

  int getCurrentMinute() {
    return manualMinute;
  }
}
