Background background;
Bird bird;
Rain rain;
void setup(){
 size(1280, 720);
 background(0, 10, 5); 
 background = new Background();
 bird = new Bird();
 
 //Testing purposes only! Weather should only be spawned in the Background class.
 rain = new Rain(150);
 //birdsArray = new Bird[15];
}

void draw(){
   background(0, 10, 5); 
// background.drawBackground();
// bird.drawBird();
   rain.drawRain();
}

