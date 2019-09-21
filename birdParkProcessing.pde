Bird bird;
Weather weatherHandler;

void setup(){
 size(1280, 720);
 background(0, 10, 5); 
 bird = new Bird();
 weatherHandler = new Weather();
}

void draw(){
   background(0, 0, 0);
   weatherHandler.drawWeather();  
  
}

void keyPressed(){
    if(key == 'i'){
      weatherHandler.setInstructions();
    }
    if(key == 'r'){
      weatherHandler.setRain();
    }
    if(key == 'c'){
      weatherHandler.setClouds();
    }
    if(key == 't'){
      weatherHandler.setThunder();
    }
    if(key == '='){
      //increase rain frequency
      weatherHandler.increaseRain();
    }
    if(key == '-'){
      weatherHandler.decreaseRain();
    }
}

