import beads.*;
import org.jaudiolibs.beads.*;

ArrayList<MakeBird> birds;
int numberOfBirds;
boolean spawn;

boolean audio;
AudioContext ac;
UGen microphoneIn;

void setup() {
  size(1280, 720);
  frameRate(24);
  imageMode(CENTER);

  birds = new ArrayList<MakeBird>();
  numberOfBirds = 10;
  for (int i = 0; i < numberOfBirds; ++i) {
    birds.add(new MakeBird());
  }
  spawn = true;

  audio = false;
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
  if (microphoneIn.getOutBuffer(0)[0] > 0.35) {
    audio = true;
  }
}
  
  
void sortBirds(){
  
}  
  
  
void bg() {
  background(255);
  fill(180);
  noStroke();
  rect(0, 300, 1280, 420);
}
