import beads.*;
import org.jaudiolibs.beads.*;
import ddf.minim.Minim;
import ddf.minim.AudioPlayer;

Minim minim;
AudioPlayer bgSound;

Background backgroundHandler;
Boolean audio;

void setup() {
  size(1280, 720, P3D);
  frameRate(24);
  imageMode(CENTER);
  
  backgroundHandler = new Background();

  minim = new Minim(this);
  bgSound = minim.loadFile("ParkSound.mp3");
  bgSound.loop();
}


void draw() {
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

void mousePressed() {
  backgroundHandler.addFood();
}
