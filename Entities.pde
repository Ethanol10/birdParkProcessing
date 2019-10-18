class Entities{
  ArrayList <Food> foods;
  int foodWidth = 10;

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

    foods = new ArrayList<Food>();
  }
  
  //Draw entities
  void drawEntities(){
    microphoneIn.update();
    checkAudio();
    try {
      for (int j = foods.size()-1; j >= 0; j--) { 
        Food food = foods.get(j);
        food.display();
        food.move();
        // food.birdMove();
        if (food.finished()) {
          foods.remove(j);
        }
      }
    } catch (Exception e) {
      println("foods.size is null");
    }
    for (int i = 0; i < numberOfBirds; ++i) {
      birds.get(i).use();
      for(int k = 0; k< foods.size(); k++){
        birds.get(i).checkFoodPosition(foods.get(k).getFoodXPosition(),foods.get(k).getFoodYPosition());
        birds.get(i).checkFoodLife(foods.get(k).getFoodLife());
      }
    }
    
  }

  void addEntity(){
    foods.add(new Food(mouseX, mouseY, foodWidth));
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
