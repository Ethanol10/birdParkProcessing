Background background;
Bird bird;
Rain rain;
Clouds cloud;
boolean drawRain = true;
boolean drawCloud = true;
boolean drawThunder = true;

void setup(){
 size(1280, 720);
 background(0, 10, 5); 
 background = new Background();
 bird = new Bird();
 
 //Testing purposes only! Weather should only be spawned in the Background class.
 rain = new Rain(100, 500, 10, 20);
 cloud = new Clouds(5, 0.2, 150);
 //birdsArray = new Bird[15];
}

void draw(){
   background(0, 10, 5);
   
   if(drawCloud){
     //draw Clouds
     cloud.drawClouds();
   }
   //draw rain
   if(drawRain){
     rain.drawRain();
   }
   if(drawThunder){
     //draw Thunder
   }
}

void keyPressed(){
  if(key == 'r'){
    drawRain = !drawRain;
  }
  if(key == 'c'){
    drawCloud = !drawCloud;
  }
  if(key == 't'){
    drawThunder = !drawThunder;
  }
}
