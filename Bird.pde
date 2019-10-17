class Bird {
  PImage [] peck;
  PImage [] hop;
  PImage [] chirp;
  PImage [] fly;
  int i;

  int x, y; //position
  int z, w; //scale values
  
  int y2, x5; //save y and x position
  int x3;
  int x4;
  int y4;

  float scale;


  Bird(int x, int y, String colour) {
    scale = 0.15 +(float)y/2000;
    z = (int)(420*scale);
    w = (int)(380*scale);
    this.x = x;
    this.y = y;
    y2 = y;

    //put frames into arrays
    peck = new PImage[5];   
    for (int i = 0; i < 5; ++i) {
      String filename = colour + "peck" + (i+1) + ".png";
      peck[i] = loadImage(filename);
    }

    hop = new PImage[4];
    for (int i = 0; i < 4; ++i) {
      String filename = colour + "hop" + (i+1) + ".png";
      hop[i] = loadImage(filename);
    }

    chirp = new PImage[3];
    for (int i = 0; i < 3; ++i) {
      String filename = colour + "chirp" + (i+1) + ".png";
      chirp[i] = loadImage(filename);
    }

    fly = new PImage[7];
    for (int i = 0; i < 7; ++i) {
      String filename = colour + "fly" + (i+1) + ".png";
      fly[i] = loadImage(filename);
    }

    i = 0;    
  }


  void startAnimation() {
    //allows animation to start
    i = 2;
  }
  
  void stopAnimation() {
    i = 0;
  }


  void peck(int a) { 
    pushMatrix();
    scale(1*a, 1);
    tint(255, 255);
    imageMode(CENTER);
    int x2 = x*a;
    if (i > 0 && i <= 11) {
      y = y2;
      image(peck[0], x2, y, z, w);
    }
    if (i >= 12 && i <= 13) {
      image(peck[1], x2, y, z, w);
    }
    if (i >= 14 && i <= 15) {
      image(peck[2], x2, y, z, w);
    }
    if (i >= 16 && i <= 17) {
      image(peck[3], x2, y, z, w);
    }    
    if (i >= 18 && i <= 19) {
      image(peck[4], x2, y, z, w);
    }
    if (i >= 20 && i <= 21) {
      image(peck[3], x2, y, z, w);
    }  
    if (i >= 22 && i <= 23) {
      image(peck[2], x2, y, z, w);
    }  
    if (i >= 24 && i <= 25) {
      image(peck[1], x2, y, z, w);
    }  
    if (i >= 26 && i < 40) {
      image(peck[0], x2, y, z, w);
    }  
    if (i >= 40) {
      image(peck[0], x2, y, z, w);
      i = 0;
    }
    if (i < 40 && i > 0) {
      ++i;
    }
    popMatrix();
  }



  void hop(int a) {
    pushMatrix();
    scale(1*a, 1);
    tint(255, 255);
    imageMode(CENTER);
    int x2 = x*a;
    if (i >= 2 && i <= 3) {
      y = y2;
      image(hop[0], x2, y, z, w);
    }
    if (i >= 4 && i <= 5) {
      image(hop[1], x2, y, z, w);
    }
    if (i >= 6 && i <= 7) {
      shift(-15*a, -30);
      image(hop[2], x2, y, z, w);
    }    
    if (i >= 8 && i <= 9) {
      shift(-15*a, 15);
      image(hop[3], x2, y, z, w);
    }    
    if (i >= 10 && i <= 11) {
      shift(0, 15);
      image(hop[1], x2, y, z, w);
    }  
    if (i >= 12) {
      image(hop[0], x2, y, z, w);
      i = 0;
    }  
    if (i < 12) {
      ++i;
    }
    popMatrix();
  }


  void chirp(int a, int b) {
    pushMatrix();
    scale(1*a, 1);
    tint(255, 255);
    imageMode(CENTER);
    int x2 = x*a;
    y = y2;
    image(chirp[b], x2, y, z, w);
    popMatrix();
  }


  void stand(int a) {
    pushMatrix();
    scale(1*a, 1);
    tint(255, 255);
    imageMode(CENTER);
    int x2 = x*a;
    y = y2;
    image(peck[0], x2, y, z, w);
    popMatrix();
  }


  void crouch(int a) {
    pushMatrix();
    scale(1*a, 1);
    tint(255, 255);
    imageMode(CENTER);
    int x2 = x*a;
    if (i >= 2 && i <= 3) {
      y = y2;
      image(fly[0], x2, y, z, w);
    }
    if (i >= 4 && i <= 5) {
      image(fly[1], x2, y, z, w);
    }
    if (i >= 6 && i <= 7) {
      image(fly[2], x2, y, z, w);
    }    
    if (i >= 8) {
      image(fly[3], x2, y, z, w);
      i = 0;
    }      
    if (i < 8) {
      ++i;
    }
    popMatrix();
  }


  void fly(int a) {
    pushMatrix();
    scale(1*a, 1);
    tint(255, 255);
    imageMode(CENTER);
    int x2 = x*a;
    int x3 = -25*a;
    if (i >= 2 && i <= 3) {
      shift(x3, -50);
      image(fly[4], x2, y, z, w);
    }    
    if (i >= 4 && i <= 5) {
      shift(x3, -50);
      image(fly[5], x2, y, z, w);
    }
    if (i >= 6 && i <= 7) {
      shift(x3, -50);
      image(fly[6], x2, y, z, w);
    }
    if (i >= 8 && i <= 9) {
      shift(x3, -50);
      image(fly[5], x2, y, z, w);
    }    
    if (i >= 10 && i <= 11) {
      shift(x3, -50);
      image(fly[4], x2, y, z, w);
    }
    if (i >= 12 && i <= 13) {
      shift(x3, -50);
      image(fly[5], x2, y, z, w);
    }
    if (i >= 14 && i <= 15) {
      shift(x3, -50);
      image(fly[6], x2, y, z, w);
    }    
    if (i >= 16 && i <= 17) {
      shift(x3, -50);
      image(fly[5], x2, y, z, w);
    }
    if (i >= 18 && i <= 19) {
      shift(x3, -50);
      image(fly[4], x2, y, z, w);
    }
    if (i >= 20 && i <= 21) {
      shift(x3, -50);
      image(fly[5], x2, y, z, w);
    }    
    if (i >= 22 && i <= 23) {
      shift(x3, -50);
      image(fly[6], x2, y, z, w);
    }
    if (i >= 24 && i <= 25) {
      shift(x3, -50);
      image(fly[5], x2, y, z, w);
    }
    if (i >= 26 && i <= 27) {
      shift(x3, -50);
      image(fly[4], x2, y, z, w);
    }    
    if (i >= 28 && i <= 29) {
      shift(x3, -50);
      image(fly[5], x2, y, z, w);
    }
    if (i >= 30) {
      shift(x3, -50);
      image(fly[6], x2, y, z, w);
      i = 0;
    }   
    if (i < 30) {
      ++i;
    }
    popMatrix();
  }


  void spawn(int a) {
    pushMatrix();
    scale(1*a, 1);
    tint(255, 255);
    imageMode(CENTER);
    int x2 = x*a;
    int x3 = -20*a;
    int y3 = y2/16;
    if (i >= 2 && i <= 3) {
      shift(x3, y3);
      image(fly[5], x2, y, z, w);
    }
    if (i >= 4 && i <= 5) {
      shift(x3, y3);
      image(fly[6], x2, y, z, w);
    }
    if (i >= 6 && i <= 7) {
      shift(x3, y3);
      image(fly[5], x2, y, z, w);
    }
    if (i >= 8 && i <= 9) {
      shift(x3, y3);
      image(fly[4], x2, y, z, w);
    }
    if (i >= 10 && i <= 11) {
      shift(x3, y3);
      image(fly[5], x2, y, z, w);
    }
    if (i >= 12 && i <= 13) {
      shift(x3, y3);
      image(fly[6], x2, y, z, w);
    }
    if (i >= 14 && i <= 15) {
      shift(x3, y3);
      image(fly[5], x2, y, z, w);
    }
    if (i >= 16) {
      shift(x3, y3);
      image(fly[4], x2, y, z, w);
      i = 0;
    }
    if (i < 16) {
      ++i;
    }
    popMatrix();
  }


  void land(int a) {
    pushMatrix();
    scale(1*a, 1);
    tint(255, 255);
    imageMode(CENTER);
    int x2 = x*a;
    if (i >= 2 && i <= 3) {
      y = y2;
      image(fly[3], x2, y, z, w);
    }
    if (i >= 4 && i <= 5) {
      image(fly[2], x2, y, z, w);
    }
    if (i >= 6 && i <= 7) {
      image(fly[1], x2, y, z, w);
    }    
    if (i >= 8) {
      image(fly[0], x2, y, z, w);
      i = 0;
    }      
    if (i < 8) {
      ++i;
    }
    popMatrix();
  }
  
   void move(int a, int b, int c, int d) {
    pushMatrix();
    scale(1*a, 1);
    tint(255, 255);
    imageMode(CENTER);
    int x4 = x*a;
    if (i >= 2 && i <= 3) {
      x3 = c/8;
      y4 = d/4;
      x5 = x;
      image(hop[0], x4, y, z, w);
    }
    if (i >= 4 && i <= 5) {
      image(hop[1], x4, y, z, w);
    }
    if (i >= 6 && i <= 7) {
      shift(-x3*a, -30);
      shift(0, -y4*b);
      image(hop[2], x4, y, z, w);
    }    
    if (i >= 8 && i <= 9) {
      shift(-x3*a, 15);
      image(hop[3], x4, y, z, w);
    }    
    if (i >= 10 && i <= 11) {
      shift(0, 15);
      image(hop[1], x4, y, z, w);
    }  
    if (i >= 12 && i <= 13) {
      image(hop[0], x4, y, z, w);
    }
    if (i >= 14 && i <= 15) {
      image(hop[1], x4, y, z, w);
    }
    if (i >= 16 && i <= 17) {
      shift(-x3*a, -30);
      shift(0, -y4*b);
      image(hop[2], x4, y, z, w);
    }    
    if (i >= 18 && i <= 19) {
      shift(-x3*a, 15);
      image(hop[3], x4, y, z, w);
    }    
    if (i >= 20 && i <= 21) {
      shift(0, 15);
      image(hop[1], x4, y, z, w);
    }  
    if (i >= 22 && i <= 23) {
      image(hop[0], x4, y, z, w);
    }  
    if (i >= 24 && i <= 25) {
      image(hop[1], x4, y, z, w);
    }
    if (i >= 26 && i <= 27) {
      shift(-x3*a, -30);
      shift(0, -y4*b);
      image(hop[2], x4, y, z, w);
    }    
    if (i >= 28 && i <= 29) {
      shift(-x3*a, 15);
      image(hop[3], x4, y, z, w);
    }    
    if (i >= 30 && i <= 31) {
      shift(0, 15);
      image(hop[1], x4, y, z, w);
    }  
    if (i >= 32 && i <= 33) {
      image(hop[0], x4, y, z, w);
    }  
    if (i >= 34 && i <= 35) {
      image(hop[1], x4, y, z, w);
    }
    if (i >= 36 && i <= 37) {
      shift(-x3*a, -30);
      shift(0, -y4*b);
      image(hop[2], x4, y, z, w);
    }    
    if (i >= 38 && i <= 39) {
      shift(-x3*a, 15);
      image(hop[3], x4, y, z, w);
    }    
    if (i >= 40 && i <= 41) {
      shift(0, 15);
      image(hop[1], x4, y, z, w);
    }  
    if (i >= 42) {
      image(hop[0], x4, y, z, w);
    }    
    if (i < 42) {
      ++i;
    }
    popMatrix();
  }


void eat(int a){
    pushMatrix();
    scale(1*a, 1);
    tint(255, 255);
    imageMode(CENTER);
    int x2 = x*a;
    if (i > 0 && i <= 11) {
      image(peck[0], x2, y, z, w);
    }
    if (i >= 12 && i <= 13) {
      image(peck[1], x2, y, z, w);
    }
    if (i >= 14 && i <= 15) {
      image(peck[2], x2, y, z, w);
    }
    if (i >= 16 && i <= 17) {
      image(peck[3], x2, y, z, w);
    }    
    if (i >= 18 && i <= 19) {
      image(peck[4], x2, y, z, w);
    }
    if (i >= 20 && i <= 21) {
      image(peck[3], x2, y, z, w);
    }  
    if (i >= 22 && i <= 23) {
      image(peck[2], x2, y, z, w);
    }  
    if (i >= 24 && i <= 25) {
      image(peck[1], x2, y, z, w);
    }  
    if (i >= 26 && i < 40) {
      image(peck[0], x2, y, z, w);
    }  
    if (i >= 40) {
      image(peck[0], x2, y, z, w);
      i = 2;
    }
    if (i < 40 && i > 0) {
      ++i;
    }
    popMatrix();
  }
  
  void moveBack(int a, int b, int c, int d) {
    pushMatrix();
    scale(1*a, 1);
    tint(255, 255);
    imageMode(CENTER);
    int x4 = x*a;
    if (i >= 2 && i <= 3) {
      x3 = c/3;
      y4 = d/3;
      image(hop[0], x4, y, z, w);
    }
    if (i >= 4 && i <= 5) {
      image(hop[1], x4, y, z, w);
    }
    if (i >= 6 && i <= 7) {
      shift(-x3*a, -30);
      shift(0, -y4*b);
      image(hop[2], x4, y, z, w);
    }    
    if (i >= 8 && i <= 9) {
      shift(-x3*a, 15);
      image(hop[3], x4, y, z, w);
    }    
    if (i >= 10 && i <= 11) {
      shift(0, 15);
      image(hop[1], x4, y, z, w);
    }  
    if (i >= 12 && i <= 13) {
      image(hop[0], x4, y, z, w);
    }
    if (i >= 14 && i <= 15) {
      image(hop[1], x4, y, z, w);
    }
    if (i >= 16 && i <= 17) {
      shift(-x3*a, -30);
      shift(0, -y4*b);
      image(hop[2], x4, y, z, w);
    }    
    if (i >= 18 && i <= 19) {
      shift(-x3*a, 15);
      image(hop[3], x4, y, z, w);
    }    
    if (i >= 20 && i <= 21) {
      shift(0, 15);
      image(hop[1], x4, y, z, w);
    }  
    if (i >= 22 && i <= 23) {
      image(hop[0], x4, y, z, w);
    }  
    if (i >= 24 && i <= 25) {
      image(hop[1], x4, y, z, w);
    }
    if (i >= 26 && i <= 27) {
      shift(-x3*a, -30);
      shift(0, -y4*b);
      image(hop[2], x4, y, z, w);
    }    
    if (i >= 28 && i <= 29) {
      shift(-x3*a, 15);
      image(hop[3], x4, y, z, w);
    }    
    if (i >= 30 && i <= 31) {
      shift(0, 15);
      image(hop[1], x4, y, z, w);
    }  
    if (i >= 32) {
      image(hop[0], x4, y, z, w);
      x = x5;
      y = y2;
    }    
    if (i < 32) {
      ++i;
    }
    popMatrix();
  }


  void respawn() {
    x = (int)random(340, 940);
    y = 0;
  }


  void shift(int x, int y) {
    this.x += x;
    this.y += y;
  }


  int limitX(int boundary) {
    int limit = (int)(x + (boundary*scale));
    return limit;
  }


  int limitY(int boundary) {
    int limit = (int)(y + (boundary*scale));
    return limit;
  }
}

