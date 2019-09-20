class Food {
  float x;
  float y;
  float xInt, yInt;
  float w, wStill;
  float r1, r2, r3, r4;
  float speed;
  float gravity;
  float birdSpeed = 1;
  float life = 1000;
  float birdX, birdY;
  

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
    r1 = random(10, 30);
    r2 = random(10, 30);
    r3 = random(10, 30);
    r4 = random(10, 30);
    speed = 0;
    gravity = 0.1;
    birdX = Math.round(random(0, width-50));
    birdY = Math.round(random(0, height-50));
    
  }
  
  void display() {
    fill(0,life);
    noStroke();
    
    ellipse(x,y,w,w);
    ellipse(x-r1,y-r4,w,w);
    ellipse(x+r2,y-r3,w,w);
    ellipse(x+r3,y+r2,w,w);
    ellipse(x-r4,y+r1,w,w);
    ellipse(x+r1,y-r2,w,w);
    ellipse(x-r3,y+r4,w,w);
    rect(birdX, birdY, 50, 50);
  }

  void move() {
    if (y < height*3/4) {
      speed = speed + gravity;
      y = y + speed;
      if (w < wStill) {
        w = w + 0.15;
      }
    }
  }

  void birdMove() {
    if (y > height*3/4) {
      xInt = Math.round(x);
      yInt = Math.round(y);
      
      // Birds sitting __ compare to food
      if(birdX > xInt){ // Right
        birdX -= birdSpeed;
        if(birdY < yInt){ // I (++) Quadrant
          birdY += birdSpeed;
        } else if (birdY > yInt) { // IV (+-) Quadrant
          birdY -= birdSpeed;
        } else if (birdY == yInt) { // + X-axis
          birdY = yInt;
        } 
      } 
      if (birdX < xInt) { // Left
        birdX += birdSpeed;
        if(birdY < yInt){ // II (-+) Quadrant
          birdY += birdSpeed;
        } else if (birdY > yInt) { // III (--) Quadrant
          birdY -= birdSpeed;
        } else if (birdY == yInt) { // - X-axis
          birdY = yInt;
        }
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
