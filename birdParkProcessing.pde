import beads.*;
import org.jaudiolibs.beads.*;
import ddf.minim.Minim;
import ddf.minim.AudioPlayer;

Minim minim;
AudioPlayer bgSound;

Background backgroundHandler;
Boolean audio;

boolean cursorMode = true;
boolean foodMode = false;

PImage cursor;
PImage foodCursor;

PImage cursorIcon;
PImage foodIcon;



void setup() {
  size(1280, 720, P3D);
  imageMode(CENTER);
  
  foodCursor = loadImage("foodCursor.png");  
  cursor = loadImage("cursor.png");
  
  foodIcon = loadImage("foodIcon.png");  
  cursorIcon = loadImage("cursorIcon.png");
  
  cursor(cursor, 0, 0);
  backgroundHandler = new Background();
  
  minim = new Minim(this);
  bgSound = minim.loadFile("ParkSound.mp3");
  bgSound.loop();
}


void draw() {
  background(0);
  backgroundHandler.drawBackground();
  imageMode(CORNER);
  tint(255, 255);
  image(cursorIcon, width - 180, 15);
  image(foodIcon, width - 90, 15);
  
  if(foodMode){
    cursor(foodCursor, foodCursor.width/2, foodCursor.height/2);
  }
  else{
    cursor(cursor, 0, 0);
  }
} 

void mousePressed(){
  backgroundHandler.mouseClickedBackground();
  if(mouseY > 200 && foodMode){
    backgroundHandler.addFood();
  }
  
  if(iconCollision(mouseX, mouseY, width -180, 15, (int)cursorIcon.width, (int)cursorIcon.height)){
    cursorMode = true;
    foodMode = false;
  }
  if(iconCollision(mouseX, mouseY, width - 90, 15, (int)foodIcon.width, (int)foodIcon.height)){
    cursorMode = false;
    foodMode = true;
  }
}

boolean iconCollision(int px, int py, int ix, int iy, int iw, int ih){
  if(px >= ix && px <= ix + iw){
    if(py >= iy && py <= py + ih){
      return true;
    }
  }
  return false;
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
