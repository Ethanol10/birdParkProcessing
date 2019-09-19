class Food {
  float x;
  float y;
  float w, wStill;
  float r1, r2, r3, r4;
  float speed;
  float gravity;
  float life = 300;

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
    float life = 300;
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
