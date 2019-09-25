import beads.*;
import org.jaudiolibs.beads.*;

ArrayList<MakeBird> birds;
int [] y;
int numberOfBirds;
boolean audio;
AudioContext ac;
UGen microphoneIn;
Background backgroundHandler;

void setup() {
  size(1280, 720, P3D);
  frameRate(24);
  imageMode(CENTER);
  audio = false;

  numberOfBirds = 15;
  y = new int[numberOfBirds];
  for (int i = 0; i < numberOfBirds; ++i) {
    y[i] = (int)random(300, 640);
  }
  y = sort(y);

  birds = new ArrayList<MakeBird>();
  for (int i = 0; i < numberOfBirds; ++i) {
    birds.add(new MakeBird(y[i]));
  }
  
  ac = new AudioContext();
  microphoneIn = ac.getAudioInput();
  Gain g = new Gain(ac, 1, 0);
  g.addInput(microphoneIn);
  ac.out.addInput(g);
  ac.start();
  
  backgroundHandler = new Background();
}


void draw() {
  background(0);
  backgroundHandler.drawBackground();
  microphoneIn.update();
  checkAudio();
  for (int i = 0; i < numberOfBirds; ++i) {
    birds.get(i).use();
  }
}

void checkAudio() {
  if (microphoneIn.getOutBuffer(0)[0] > 0.07) {
    audio = true;
  }
}


void bg() {
  background(255);
  fill(180);
  noStroke();
  rect(0, 300, 1280, 420);
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