class Entities{
  ArrayList <Food> food;
  ArrayList <MakeBird> birds;
    
  int [] y;
  int numberOfBirds;
  AudioContext ac;
  UGen microphoneIn;

  
  Entities(){
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
  
  //Draw entities
  void drawEntities(){
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
  
  //MakeBird has a bird within its class. make a method that allows entities to read those birds and pass relevant 
  //information to food within this class.`
  
  //Check if the point p is anywhere within a circle with point c and radius r.
  boolean isOverCircle(float px, float py, float cx, float cy, float r) {
    float distX = px - cx;
    float distY = py - cy;
    float distance = sqrt( (distX*distX) + (distY*distY) );
  
    if (distance <= r) {
      return true;
    }
    return false;
  }
  
  //Return distance between point 1 and point 2
  float distanceBetweenPoints(float x1, float y1, float x2, float y2){
    float distX = x1 - x2;
    float distY = y1 - y2;
    
    return sqrt( (distX*distX) + (distY*distY) );
  }
  
}
