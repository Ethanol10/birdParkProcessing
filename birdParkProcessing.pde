Background background;
Bird[] birdsArray;

void setup(){
 size(1280, 720); 
 background = new Background();
 birdsArray = new Bird[15];
}

void draw(){
 background.drawBackground();
 for(int i = 0; i < birdsArray.length; i++){
   birdsArray[i].drawBird();
 }
}

