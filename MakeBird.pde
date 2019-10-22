class MakeBird { 
  Bird bird;

  //bird colours
  String [] colours = {
    "black", "purple", "navy", "blue", "green", "orange", "yellow", "red", "pink", "white"
  };
  int colour;

  //control animation
  int interval;
  int flyInterval;
  int spawnInterval;
  int moveInterval;
  int eatInterval;
  int returnInterval;

  int wait;
  boolean spawn;
  boolean fly;
  boolean isMoving;
  boolean eating;
  boolean moveBack;

  int action;
  int direction; //which way the bird is facing: 1 = left, -1 = right

  int foodXPosition;
  int foodYPosition;
  boolean foodExists;
  float foodLife;

  AudioContext ac;
  String file;
  SamplePlayer sp;
  Gain g;


  MakeBird(int y) {
    interval = 0;
    flyInterval = 0;
    spawnInterval = 0;
    moveInterval = 0;
    eatInterval = 0;
    returnInterval = 0;
    wait = 0;
    foodXPosition = 0;
    foodYPosition = 0;

    randomDirection();
    spawn = true;
    isMoving = false;
    eating = false;
    moveBack = false;
    colour = (int)random(10);
    bird = new Bird((int)random(0, 1280), y, colours[colour]);

    ac = new AudioContext();
    file = sketchPath("") + "bird.mp3";
    try {
      sp = new SamplePlayer(ac, new Sample(file));
    }
    catch(Exception e) {
      println("Audio file not found.");
    }
    sp.setKillOnEnd(false);
    float pitch = getPitch(colour);
    sp.setRate(new Glide(ac, pitch));
    g = new Gain(ac, 1, 1);
    g.addInput(sp);
    ac.out.addInput(g);
  }


  void use() {   
    checkPosition(); //check bird position
    checkFoodLife();

      //fly into frame from above
    if (spawn) {
      if (spawnInterval == 0) {
        bird.respawn();
        spawnInterval += 2;
      }
      spawn(direction);
    }

    resetIntervals();
    //fly away when noise is loud enough
    if (fly && !spawn && !isMoving && !eating && !moveBack) {
      if (flyInterval == 0) {
        flyInterval += 2;
      }
      fly(direction);
    }

    //randomly peck/hop/stand
    if (!checkMouse() && !fly && !spawn && !isMoving && !eating && !moveBack) {
      bird.setScale();
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
    if (checkMouse() && !fly && !spawn && !isMoving && !eating && !moveBack && cursorMode) {
      bird.setScale();
      chirp(direction);
    }

    //move to food
    if (isMoving && !eating && !moveBack) {
      bird.setScale();
      if (moveInterval == 0) {
        moveInterval += 2;
      }
      moveToFood(direction);
    }

    //eat
    if (eating) {
      bird.setScale();
      if (eatInterval == 0) {
        eatInterval += 2;
      }
      eat(getXDirection(bird.x, foodXPosition));
    }

    //move back to original position
    if (moveBack) {
      bird.setScale();
      if (returnInterval == 0) {
        returnInterval += 2;
      }
      moveBack();
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
      if (interval >= 2 && interval <= 60) {
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
    sp.setToLoopStart();
    int b = a;
    bird.y = bird.y2;
    if (direction == -1) {
      b = 2;
    }
    bird.chirp(direction, b);
    sp.setToLoopStart();
    ac.start();
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


  void moveToFood(int a) {
    if (moveInterval >= 2 && moveInterval <= 3) {
      bird.x2 = bird.x;
      bird.x3 =  distanceFromPointX(foodXPosition)/8;
      bird.y3 = distanceFromPointY(height*3/4)/4;
      bird.stand(a);
      bird.startAnimation();
    }
    if (moveInterval >= 4) {
      bird.move(getXDirection(bird.x, foodXPosition), getYDirection(bird.y, height*3/4));
    }
    if (distanceFromPointX(foodXPosition) < 125 && distanceFromPointY(height*3/4) < 75) {
      bird.stopAnimation();
      eating = true;
      isMoving = false;
    }
    if (moveInterval > 0) {
      ++moveInterval;
    }
  }


  void eat(int a) {
    if (eatInterval >= 2 && eatInterval <= 3) {
      bird.startAnimation();
    }
    if (eatInterval >= 4) {
      bird.eat(a);
    } 
    if (eatInterval > 0 && !foodExists) {
      bird.stopAnimation();
      moveBack = true;
      eating = false;
    }
    if (eatInterval > 0) {
      ++eatInterval;
    }
  }


  void moveBack() {
    if (returnInterval >= 2 && returnInterval <= 3) {
      bird.x3 =  distanceFromPointX(bird.x2)/8;
      bird.y3 = distanceFromPointY(bird.y2)/4;
      bird.startAnimation();
    }
    if (returnInterval >= 4) {
      bird.moveBack(getXDirection(bird.x, bird.x2), getYDirection(bird.y, bird.y2));
    }
    if (returnInterval >= 45 || (bird.x == bird.x2 && bird.y == bird.y2)) {
      bird.x = bird.x2;
      bird.y = bird.y2;
      bird.stopAnimation();
      moveBack = false;
    }
    if (returnInterval > 0 && returnInterval <= 45) {
      ++returnInterval;
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
    if (audio == true && bird.y == bird.y2) {
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


  void resetIntervals() {
    if (bird.y == bird.y2) {
      spawn = false;
      spawnInterval = 0;
    }
    if (isMoving == false) {
      moveInterval = 0;
    }
    if (eating == false) {
      eatInterval = 0;
    }
    if (moveBack == false) {
      returnInterval = 0;
    }
  }


  void checkFoodPosition(float foodXPosition, float foodYPosition, float foodLife) {
    if (!isMoving && !eating && !fly && !spawn && !moveBack) {
      if (checkRange(foodXPosition, foodYPosition)) {
        isMoving = true;
        this.foodLife = foodLife;
        foodExists = true;
        this.foodXPosition = int(foodXPosition);
        this.foodYPosition = int(foodYPosition);
      }
    }
  }


  boolean checkRange(float foodXPosition, float foodYPosition) {
    float distX = foodXPosition - bird.x;
    float distY = foodYPosition - bird.y;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    if (distance <= 200) {
      return true;
    }
    return false;
  }


  int getXDirection(int birdX, int pointX) {
    if (pointX > birdX) {
      return -1;
    }
    return 1;
  }

  int getYDirection(int birdY, int pointY) {
    if (pointY > birdY) {
      return -1;
    }
    return 1;
  }


  int distanceFromPointX(int position) {
    if (getXDirection(bird.x, position) == -1) {
      return position - bird.x;
    }
    return bird.x - position;
  }

  int distanceFromPointY(int position) {
    if (getYDirection(bird.y, position) == -1) {
      return position - bird.y;
    }
    return bird.y - position;
  }


  void checkFoodLife() {
    if (foodLife > 0) {
      --foodLife;
    }
    if (foodLife == 0) {
      foodExists = false;
    } else {
      foodExists = true;
    }
  }


  float getPitch(int colour) {
    return 0.8+(colour*0.2);
  }
}

