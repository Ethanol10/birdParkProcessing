class Food {
  float x;
  float y;
  float xInt, yInt;
  float w, wStill;

  int numOfFood = 5;
  float [] randomFood1;
  float [] randomFood2;

  float speed;
  float gravity;
  float birdSpeed = 1;
  float life = 1000;

  float birdX, birdY;
  float birdXFly = 0;
  float birdYFly = 0;
  
  Food(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    if (y < height*1/4) {
      w = tempW*1/4;
      wStill = tempW;
    } else if (y < height*2/4) {
      w = tempW*2/4;
      wStill = tempW;
    } else if (y < height*3/4) {
      w = tempW*3/4;
      wStill = tempW;
    } else {
      w = tempW;
    }

    randomFood1 = new float[numOfFood];
    randomFood2 = new float[numOfFood]; 
    for (int i = 0; i < numOfFood; i++) {
      randomFood1[i] = random(10, 80);
      randomFood2[i] = random(10, 80);
    }

    speed = 0;
    gravity = 0.1;
    birdX = Math.round(random(0, width-50));
    birdY = Math.round(random(0, height-50));
  }
  
  void display() {
    fill(0,life);
    noStroke();

    ellipse(x, y, w*2, w);
    for (int i = 0; i < numOfFood; i++) {
      ellipse(x+randomFood2[i],y+randomFood1[i],w*2,w);
      ellipse(x-randomFood1[i],y+randomFood2[i],w*2,w);
    }

    //rect(birdX + birdXFly, birdY + birdYFly, 80, 50);
  }

  void move() {
    if (y < height*3/4) {
      speed = speed + gravity;
      y = y + speed;
      for (int i = 0; i < numOfFood; i++) {
        randomFood1[i] += i*0.15;
        randomFood2[i] += i*0.25;
      }
      if (w < wStill) {
        w = w + 0.15;
      }
    }
  }

  float getFoodXPosition(){
    return x;
  }
  float getFoodYPosition(){
    return y;
  }

  void birdMove() {
    if (y > height*3/4) {
      xInt = Math.round(x);
      yInt = Math.round(y);
      // Birds sitting __ compare to food
      if(birdX > xInt){ // Right
        if(birdXFly>(xInt - birdX)){
          birdXFly--;
        }
        birdYMovement();
      } 
      if (birdX < xInt) { // Left
        if(birdXFly<(xInt - birdX)){
          birdXFly++;
        }
        birdYMovement();
      } 
      if (birdX == xInt) { // Y-axis
        if(birdY < yInt){ // + Y-axis
          birdY += birdSpeed;
        } else if (birdY > yInt) { // - Y-axis
          birdY -= birdSpeed;
        } else if (birdY == yInt) { // origin
          birdY = yInt;
        }
      }
    }
  }

  void birdYMovement(){
    // if bird sitting right to food, bird is in 
    // I (++) Quadrant; IV (+-) Quadrant; + X-axis
    // if sitting left to food, then it's in II, III Quadrant and -X-axis
    if(birdY < yInt){ 
      if(birdYFly < (yInt - birdY)){
        birdYFly = (yInt - birdY)/(xInt - birdX)*birdXFly;
      } 
    } else if (birdY > yInt) { 
      if(birdYFly > (yInt - birdY)){
        birdYFly = (yInt - birdY)/(xInt - birdX)*birdXFly;
      }
    } else if (birdY == yInt) { 
      birdY = yInt;
    }
  }

  boolean finished() {
    if(w > wStill*3/4){
      life--;
      if (life < 0) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}  
