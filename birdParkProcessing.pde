Bird bird;
Background backgroundHandler;

void setup(){
 size(1280, 720, P3D);
 background(0, 10, 5); 
 bird = new Bird();
 backgroundHandler = new Background();
}

void draw(){
  background(0);
  backgroundHandler.drawBackground();
}

void keyPressed(){
    if(key == 'i'){
      backgroundHandler.setInstructions();
    }
    if(key == 'r'){
      backgroundHandler.setRain();
    }
    if(key == 'c'){
      backgroundHandler.setClouds();
    }
    if(key == 't'){
      backgroundHandler.setThunder();
    }
    if(key == '='){
      //increase rain frequency
      backgroundHandler.increaseRain();
    }
    if(key == '-'){
      backgroundHandler.decreaseRain();
    }
    if(key == 's'){
      backgroundHandler.setSun();
    }
    if(key == ']'){
      backgroundHandler.moveSunForward();
    }
    if(key == '['){
      backgroundHandler.moveSunBackward();
    }
    if(key == 'a'){
      backgroundHandler.autoSun();
    }
}

