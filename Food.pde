class Food {
  float x;
  float y;
  float w;
  float r1, r2, r3, r4;

  Food(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    r1 = random(10, 30);
    r2 = random(10, 30);
    r3 = random(10, 30);
    r4 = random(10, 30);
  }
  
  void display() {
    fill(0);
    noStroke();
    
    ellipse(x,y,w,w);
    ellipse(x-r1,y-r4,w,w);
    ellipse(x+r2,y-r3,w,w);
    ellipse(x+r3,y+r2,w,w);
    ellipse(x-r4,y+r1,w,w);
    ellipse(x+r1,y-r2,w,w);
    ellipse(x-r3,y+r4,w,w);
  }
}  
