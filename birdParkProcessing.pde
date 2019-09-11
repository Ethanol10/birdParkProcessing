Background background;
Bird bird;
Rain rain;
void setup(){
 size(1280, 720);
 background(0, 10, 5); 
 background = new Background();
 bird = new Bird();
 rain = new Rain(100);
 //birdsArray = new Bird[15];
}

void draw(){
// background.drawBackground();
// bird.drawBird();
   background(0, 10, 5); 
   rain.drawRain();
}

