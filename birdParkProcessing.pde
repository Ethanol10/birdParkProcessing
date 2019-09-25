import beads.*;
import org.jaudiolibs.beads.*;

ArrayList<MakeBird> birds;
int [] y;
int numberOfBirds;
boolean audio;
AudioContext ac;
UGen microphoneIn;


void setup() {
  size(1280, 720);
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
}


void draw() {
  bg();
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
