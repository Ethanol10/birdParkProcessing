class MakeBird { 
  Bird bird;

  //bird colours
  String [] colours = {
    "red", "orange", "yellow", "green", "blue", "purple", "navy", "pink", "white", "black"
  };

  //control animation
  int interval;
  int flyInterval;
  int spawnInterval;
  int wait;
  boolean spawn;
  boolean fly;

  int action;
  int direction; //which way the bird is facing: 1 = left, -1 = right

  int foodXPosition;
  int foodYPosition;
  boolean isMoving = false;

  MakeBird(int y) {
    interval = 0;
    flyInterval = 0;
    spawnInterval = 0;
    wait = 0;
    randomDirection();
    spawn = true;
    bird = new Bird((int)random(0, 1280), y, colours[(int)random(10)]);
    foodXPosition = 0;
    foodYPosition = 0;
  }


   void use() {
    checkPosition(); //check bird position
    //fly into frame from above
    if (spawn) {
      if (spawnInterval == 0) {
        bird.respawn();
        spawnInterval += 2;
      }
      spawn(direction);
    }
    stopSpawn();
    //fly away when noise is loud enough
    if (fly && !spawn) {
      if (flyInterval == 0) {
        flyInterval += 2;
      }
      fly(direction);
    }
    //randomly peck/hop/stand
    if (!checkMouse() && !fly && !spawn) {
      if (interval == 0) {
        bird.stand(direction);
        newAction();
        interval += 2;
      }
      peck();
      hop();
      stand();
    }
    //chirp when clicked
    if (checkMouse() && !fly && !spawn) {
      chirp(direction);
    }
  }


  void peck() {
    if (action == 1) {
      if (interval == 2) {
        randomDirection();
      }
      if (interval >= 2 && interval <= 3) {
        bird.stand(direction);
        bird.startAnimation();
      }
      if (interval >= 4) {
        bird.peck(direction);
      }
      if (interval == 42) {
        interval = 0;
      }
      if (interval < 42 && interval > 0) {
        ++interval;
      }
    }
  }


  void hop() {
    if (action == 2) {
      if (interval == 2) {
        randomDirection();
      }
      if (interval >= 2 && interval <= 3) {
        bird.stand(direction);
        bird.startAnimation();
      }
      if (interval >= 4) {
        bird.hop(direction);
      }
      if (interval >= 14) {
        interval = 0;
      }
      if (interval < 14 && interval > 0) {
        ++interval;
      }
    }
  }


  void stand() {
    if (action >= 3 && action <= 6) {
      if (interval == 2) {
        randomDirection();
      }
      if (interval >= 2 && interval <= 3) {
        bird.stand(direction);
      }
      if (interval >= 4 && interval <= 60) {
        bird.stand(direction);
      }
      if (interval >= 60) {
        interval = 0;
      }
      if (interval < 60 && interval > 0) {
        ++interval;
      }
    }
  }


  void chirp(int a) {
    int b = a;
    bird.y = bird.y2;
    if (direction == -1) {
      b = 2;
    }
    bird.chirp(direction, b);
    interval = 0;
  }


  void fly(int a) {
    if (flyInterval >= 2 && flyInterval <= 3) {
      bird.stand(a);
      bird.startAnimation();
    }
    if (flyInterval >= 4 && flyInterval <= 10) {
      bird.crouch(a);
    }
    if (flyInterval == 11) {
      bird.startAnimation();
    }
    if (flyInterval >= 11) {
      bird.fly(a);
    }
    if (flyInterval >= 41) {
      flyInterval = 0;
    }
    if (flyInterval < 40 && flyInterval > 0) {
      ++flyInterval;
    }
  }


  void spawn(int a) {
    if (spawnInterval >= 2 && spawnInterval <= 3) {
      bird.startAnimation();
    }
    if (spawnInterval >= 4 && spawnInterval <= 18) {
      bird.spawn(a);
    }
    if (spawnInterval == 19) {
      bird.startAnimation();
    }
    if (spawnInterval >= 19) {
      bird.land(a);
    }
    if (spawnInterval >= 27) {
      spawnInterval = 0;
    }
    if (spawnInterval < 27 && spawnInterval > 0) {
      ++spawnInterval;
    }
  }


  void newAction() {
    action = (int)random(1, 7);
  }

  void randomDirection() {
    direction = (int)random(0, 2);
    if (direction == 0) {
      direction = -1;
    }
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
      bird.x += 50;
    }
    if (bird.x > 1280) {
      bird.x -= 50;
    }
    if (bird.y < 0) {
      ++wait;
    }
    if (audio == true && bird.y == bird.y2){
      fly = true;
    }
    //wait a bit before the birds respawn
    if (wait > (int)random(140, 300)) {
      spawn = true;
      audio = false;
      fly = false;
      wait = 0;
    }
  }


  void stopSpawn() {
    if (bird.y == bird.y2) {
      spawn = false;
      spawnInterval = 0;
    }
  }

  void checkFoodPosition(float foodXPosition, float foodYPosition){
    if (isMoving == false){
      if(checkRange(foodXPosition, foodYPosition)){
        isMoving = true;
        this.foodXPosition = int(foodXPosition);
        this.foodYPosition = int(foodYPosition);
      }
    }
  }

  boolean checkRange(float foodXPosition, float foodYPosition){
    float distX = foodXPosition - bird.x;
    float distY = foodYPosition - bird.y;
    float distance = sqrt( (distX*distX) + (distY*distY) );
  
    if (distance <= 200) {
      return true;
    }
    return false;
  }
}

