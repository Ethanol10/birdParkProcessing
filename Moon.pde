class Moon {
  int posX = 200;
  int posY = 200;
  PImage moon;
  int moonSize;


  Moon(int inpMoonSize) {
    moon = loadImage("moon.png");
    moonSize = inpMoonSize;
    moon.resize(moonSize, moonSize);
  }

  void drawMoon() {
    image(moon, posX, posY);
  }

  void setMoonPos(int currentHour, int currentMin) {
    if(currentHour >= 0 || currentHour <= 5){
      
    }
  }
}

