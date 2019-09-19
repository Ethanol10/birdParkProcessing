class Food {
  float x;
  float y;
  float w;

  Food(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
  }
  
  void display() {
    fill(0);
    noStroke();
    
    ellipse(x,y,w,w);
  }
}  
