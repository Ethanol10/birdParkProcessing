class MakeBird { 
  Bird bird;

  //bird colours
  String [] colours = {
    "red", "orange", "yellow", "green", "blue", "purple", "white", "black"
  };

  //control animation
  int interval;
  int flyInterval;
  int spawnInterval;
  int wait;

  int action;
  int direction; //which way the bird is facing: 1 = left, 2 = right

  boolean spawning;

  MakeBird() {
    interval = 0;
    flyInterval = 0;
    spawnInterval = 0;
    wait = 0;

    direction = (int)random(1, 3);
    bird = new Bird((int)random(0, 1280), (int)random(300, 640), colours[(int)random(8)]);
  }


  void use() {
    checkPosition(); //check if the bird is still in frame
    checkRespawn(); //check if enough time has passed for bird to respawn
    
    //fly in when spawning
    /*
    if(spawn == true){
      if(spawnInterval == 0){
        ++spawnInterval;
      }
      spawnLeft();
      spawnRight();
    }
    */
      //randomly peck/hop/stand
    if (checkMouse() == false && audio == false) {
      if (interval == 0) {
        if (action >= 1 && action <= 4) {
          bird.standLeft();
        } else {
          bird.standRight();
        }
        newAction();
        ++interval;
      }
      peckLeft();
      hopLeft();
      standLeft();
      peckRight();
      hopRight();
      standRight();
    }
    //chirp when clicked
    if (checkMouse() == true && audio == false) {
      chirpLeft();
      chirpRight();
    }
    //fly away when noise is loud enough
    if (audio == true) {
      if (flyInterval == 0) {
        ++flyInterval;
      }
      flyLeft();
      flyRight();
    }
  }


  void peckLeft() {
    if (action == 1 && interval == 1) {
      direction = 1;
      bird.standLeft();
      bird.startAnimation();
    }
    if (action == 1 && interval >= 2) {
      bird.peckLeft();
    }
    if (action == 1 && interval == 20) {
      interval = 0;
    }
    if (action == 1 && interval < 20 && interval > 0) {
      ++interval;
    }
  }

  void peckRight() {
    if (action == 5 && interval == 1) {
      direction = 2;
      bird.standRight();
      bird.startAnimation();
    }
    if (action == 5 && interval >= 2) {
      bird.peckRight();
    }
    if (action == 5 && interval == 20) {
      interval = 0;
    }
    if (action == 5 && interval < 20 && interval > 0) {
      ++interval;
    }
  }


  void hopLeft() {
    if (action == 2 && interval == 1) {
      direction = 1;
      bird.standLeft();
      bird.startAnimation();
    }
    if (action == 2 && interval >= 2) {
      bird.hopLeft();
    }
    if (action == 2 && interval >= 8) {
      interval = 0;
    }
    if (action == 2 && interval < 8 && interval > 0) {
      ++interval;
    }
  }

  void hopRight() {
    if (action == 6 && interval == 1) {
      direction = 2;
      bird.standRight();
      bird.startAnimation();
    }
    if (action == 6 && interval >= 2) {
      bird.hopRight();
    }
    if (action == 6 && interval >= 8) {
      interval = 0;
    }
    if (action == 6 && interval < 8 && interval > 0) {
      ++interval;
    }
  }


  void standLeft() {
    if ((action == 3 || action == 4 )&& interval >= 1 && interval <= 30) {
      direction = 1;
      bird.standLeft();
    }
    if ((action == 3 || action == 4 ) && interval >= 30) {
      interval = 0;
    }
    if ((action == 3 || action == 4 ) && interval < 30 && interval > 0) {
      ++interval;
    }
  }

  void standRight() {
    if ((action == 7 || action == 8) && interval >= 1 && interval <= 30) {
      direction = 2;
      bird.standRight();
    }
    if ((action == 7 || action == 8) && interval >= 30) {
      interval = 0;
    }
    if ((action == 7 || action == 8) && interval < 30 && interval > 0) {
      ++interval;
    }
  }


  void chirpLeft() {
    bird.y = bird.y2;
    if (direction == 1) {
      bird.chirpLeft();
      interval = 0;
    }
  }

  void chirpRight() {
    bird.y = bird.y2;
    if (direction == 2) {
      bird.chirpRight();
      interval = 0;
    }
  }


  void flyLeft() {
    if (direction == 1 && flyInterval == 1) {
      bird.standLeft();
      bird.startAnimation();
    }
    if (direction == 1 && flyInterval >= 2 && flyInterval <= 5) {
      bird.takeOffLeft();
    }
    if (direction == 1 && flyInterval >= 6) {
      bird.startAnimation();
      bird.flyLeft();
    }
    if (direction == 1 && flyInterval >= 20) {
      audio = false;
      flyInterval = 0;
    }
    if (direction == 1 && flyInterval < 20 && flyInterval > 0) {
      ++flyInterval;
    }
  }

  void flyRight() {
    if (direction == 2 && flyInterval == 1) {
      bird.standRight();
      bird.startAnimation();
    }
    if (direction == 2 && flyInterval >= 2 && flyInterval <= 5) {
      bird.takeOffRight();
    }
    if (direction == 2 && flyInterval >= 6) {
      bird.startAnimation();
      bird.flyRight();
    }
    if (direction == 2 && flyInterval >= 20) {
      audio = false;
      flyInterval = 0;
    }
    if (direction == 2 && flyInterval < 20 && flyInterval > 0) {
      ++flyInterval;
    }
  }

/*
  void spawnLeft(){
    if (direction == 1 && spawnInterval == 2){
      bird.startAnimation();
    }
    if(direction == 1 && spawnInterval >=2){
     
    } 
  }
  
  void spawnRight(){
    if(direction == 2 && spawnInterval == 2){
      bird.startAnimation();
    }
  }
*/

  void newAction() {
    action = (int)random(1, 9);
  }


  boolean checkMouse() {
    if (mousePressed == true && mouseX > bird.limitX(-176) && mouseX < bird.limitX(176) && mouseY > bird.limitY(-50) && mouseY < bird.limitY(151)) {
      return true;
    } else {
      return false;
    }
  }


  void checkPosition() {
    if (bird.x < 0) {
      bird.x += 50/bird.scale;
    }
    if (bird.x > 1280/bird.scale) {
      bird.x -= 50/bird.scale;
    }
    if (bird.y <= -200) {
      ++wait;
    }
  }


  void checkRespawn() {
    if (wait > 70) {
      wait = 0;
      flyInterval = 0;
      bird.y = bird.y2;
      bird.x = (int)random(0, 1280/bird.scale);
    }
  }
  
  
}

