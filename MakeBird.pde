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


  MakeBird(int y) {
    interval = 0;
    flyInterval = 0;
    spawnInterval = 0;
    wait = 0;
    randomDirection();
    spawn = true;
    bird = new Bird((int)random(0, 1280), y, colours[(int)random(10)]);
  }


  void use() {
    checkPosition(); //check bird position
    //fly into frame from above
    if (spawn == true) {
      if (spawnInterval == 0) {
        bird.respawn();
        ++spawnInterval;
      }
      spawn(direction);
    }
    stopSpawn();
    //fly away when noise is loud enough
    if (fly == true && spawn == false) {
      if (flyInterval == 0) {
        ++flyInterval;
      }
      fly(direction);
    }
    //randomly peck/hop/stand
    if (checkMouse() == false && fly == false && spawn == false) {
      if (interval == 0) {
        bird.stand(direction);
        newAction();
        ++interval;
      }
      peck();
      hop();
      stand();
    }
    //chirp when clicked
    if (checkMouse() == true && fly == false && spawn == false) {
      chirp(direction);
    }
  }


  void peck() {
    if (action == 1) {
      if (interval == 1) {
        randomDirection();
        bird.stand(direction);
        bird.startAnimation();
      }
      if (interval >= 2) {
        bird.peck(direction);
      }
      if (interval == 20) {
        interval = 0;
      }
      if (interval < 20 && interval > 0) {
        ++interval;
      }
    }
  }


  void hop() {
    if (action == 2) {
      if (interval == 1) {
        randomDirection();
        bird.stand(direction);
        bird.startAnimation();
      }
      if (interval >= 2) {
        bird.hop(direction);
      }
      if (interval >= 8) {
        interval = 0;
      }
      if (interval < 8 && interval > 0) {
        ++interval;
      }
    }
  }


  void stand() {
    if (action == 3 || action == 4) {
      if (interval == 1) {
        randomDirection();
        bird.stand(direction);
      }
      if (interval > 1 && interval <= 30) {
        bird.stand(direction);
      }
      if (interval >= 30) {
        interval = 0;
      }
      if (interval < 30 && interval > 0) {
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
    if (flyInterval == 1) {
      bird.stand(a);
      bird.startAnimation();
    }
    if (flyInterval >= 2 && flyInterval <= 5) {
      bird.crouch(a);
    }
    if (flyInterval >= 6) {
      bird.startAnimation();
      bird.fly(a);
    }
    if (flyInterval >= 21) {
      flyInterval = 0;
    }
    if (flyInterval < 20 && flyInterval > 0) {
      ++flyInterval;
    }
  }


  void spawn(int a) {
    if (spawnInterval == 1) {
      bird.startAnimation();
    }
    if (spawnInterval >= 2 && spawnInterval <= 9) {
      bird.spawn(a);
    }
    if (spawnInterval >= 10) {
      bird.startAnimation();
      bird.land(a);
    }
    if (spawnInterval >= 14) {
      spawnInterval = 0;
    }
    if (spawnInterval < 14 && spawnInterval > 0) {
      ++spawnInterval;
    }
  }


  void newAction() {
    action = (int)random(1, 5);
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
    if (wait > (int)random(70, 150)) {
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
}

