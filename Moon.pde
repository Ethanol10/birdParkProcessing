class Moon {
  int posX = width - 200;
  int posY = 400;
  PImage moon;
  int moonSize;


  Moon(int inpMoonSize) {
    moon = loadImage("moon.png");
    moonSize = inpMoonSize;
    moon.resize(moonSize, moonSize);
    
  }

  void drawMoon(int currentHour, int currentMin) {
    setMoonPos(currentHour, currentMin);
    pushMatrix();
      imageMode(CENTER);
      tint(245, 243, 206, 255);
      image(moon, posX, posY);
    popMatrix();    
  }

  void setMoonPos(int currentHour, int currentMin) {
    if (currentHour >= 0 && currentHour <= 5) {
      int minAmount = 0;
      minAmount += currentHour*60;
      minAmount += currentMin;

      posY = 110 + minAmount; 
    }
    else if (currentHour >= 19 && currentHour <= 23 ) {
      int minAmount = 0;
      minAmount += (currentHour - 19) * 60;
      minAmount += currentMin;
      println(minAmount);
      
      posY = 50 + (359 - minAmount );
    }
    else{
      posY = height;
    }
  }
}

