Background background;
Bird bird;
void setup(){
 size(1280, 720); 
 background = new Background();
 bird = new Bird();
 //birdsArray = new Bird[15];
}

void draw(){
 background.drawBackground();
 bird.drawBird();
}

