class Bird {
  PImage [] peck;
  PImage [] hop;
  PImage [] chirp;
  PImage [] fly;
  int i;

  int x;
  int y;
  int y2;
  int z;
  int w;

  float scale;


  Bird(int x, int y, String colour) {
    scale = 0.15 +(float)y/2000;
    z = (int)(420*scale);
    w = (int)(380*scale);
    this.x = x;
    this.y = y;
    y2 = y; //save original y position

    //put frames into arrays
    int peckCount = 5;
    peck = new PImage[peckCount];   
    for (int i = 0; i < peckCount; ++i) {
      String filename = colour + "peck" + (i+1) + ".png";
      peck[i] = loadImage(filename);
    }

    int hopCount = 4;
    hop = new PImage[hopCount];
    for (int i = 0; i < hopCount; ++i) {
      String filename = colour + "hop" + (i+1) + ".png";
      hop[i] = loadImage(filename);
    }

    int chirpCount = 3;
    chirp = new PImage[chirpCount];
    for (int i = 0; i < chirpCount; ++i) {
      String filename = colour + "chirp" + (i+1) + ".png";
      chirp[i] = loadImage(filename);
    }

    int flyCount = 7;
    fly = new PImage[flyCount];
    for (int i = 0; i < flyCount; ++i) {
      String filename = colour + "fly" + (i+1) + ".png";
      fly[i] = loadImage(filename);
    }

    i = 0;
  }


  void startAnimation() {
    //allows animation to start
    i = 1;
  }


  void peck(int a) { 
    pushMatrix();
    scale(1*a, 1);
    tint(255, 255);
    int x2 = x*a;
    if (i > 0 && i <= 5) {
      y = y2;
      image(peck[0], x2, y, z, w);
    }
    if (i == 6) {
      image(peck[1], x2, y, z, w);
    }
    if (i == 7) {
      image(peck[2], x2, y, z, w);
    }
    if (i == 8) {
      image(peck[3], x2, y, z, w);
    }    
    if (i == 9) {
      image(peck[4], x2, y, z, w);
    }
    if (i == 10) {
      image(peck[3], x2, y, z, w);
    }  
    if (i == 11) {
      image(peck[2], x2, y, z, w);
    }  
    if (i == 12) {
      image(peck[1], x2, y, z, w);
    }  
    if (i >= 13 && i < 20) {
      image(peck[0], x2, y, z, w);
    }  
    if (i >= 20) {
      image(peck[0], x2, y, z, w);
      i = 0;
    }
    if (i < 20 && i > 0) {
      ++i;
    }
    popMatrix();
  }



  void hop(int a) {
    pushMatrix();
    scale(1*a, 1);
    tint(255, 255);
    int x2 = x*a;
    if (i == 1) {
      y = y2;
      image(hop[0], x2, y, z, w);
    }
    if (i == 2) {
      image(hop[1], x2, y, z, w);
    }
    if (i == 3) {
      shift(-15*a, -40);
      image(hop[2], x2, y, z, w);
    }    
    if (i == 4) {
      shift(-15*a, 20);
      image(hop[3], x2, y, z, w);
    }    
    if (i == 5) {
      shift(0, 20);
      image(hop[1], x2, y, z, w);
    }  
    if (i == 6) {
      image(hop[0], x2, y, z, w);
      i = 0;
    }  
    if (i < 6) {
      ++i;
    }
    popMatrix();
  }


  void chirp(int a, int b) {
    pushMatrix();
    scale(1*a, 1);
    tint(255, 255);
    int x2 = x*a;
    y = y2;
    image(chirp[b], x2, y, z, w);
    popMatrix();
  }


  void stand(int a) {
    pushMatrix();
    scale(1*a, 1);
    tint(255, 255);
    int x2 = x*a;
    y = y2;
    image(peck[0], x2, y, z, w);
    popMatrix();
  }


  void crouch(int a) {
    pushMatrix();
    scale(1*a, 1);
    tint(255, 255);
    int x2 = x*a;
    if (i == 1) {
      y = y2;
      image(fly[0], x2, y, z, w);
    }
    if (i == 2) {
      image(fly[1], x2, y, z, w);
    }
    if (i == 3) {
      image(fly[2], x2, y, z, w);
    }    
    if (i == 4) {
      image(fly[3], x2, y, z, w);
      i = 0;
    }      
    if (i < 4) {
      ++i;
    }
    popMatrix();
  }


  void fly(int a) {
    pushMatrix();
    tint(255, 255);
    scale(1*a, 1);
    int x2 = x*a;
    int x3 = -50*a;
    if (i == 1) {
      shift(x3, -100);
      image(fly[4], x2, y, z, w);
    }    
    if (i == 2) {
      shift(x3, -100);
      image(fly[5], x2, y, z, w);
    }
    if (i == 3) {
      shift(x3, -100);
      image(fly[6], x2, y, z, w);
    }
    if (i == 4) {
      shift(x3, -100);
      image(fly[5], x2, y, z, w);
    }    
    if (i == 5) {
      shift(x3, -100);
      image(fly[4], x2, y, z, w);
    }
    if (i == 6) {
      shift(x3, -100);
      image(fly[5], x2, y, z, w);
    }
    if (i == 7) {
      shift(x3, -100);
      image(fly[6], x2, y, z, w);
    }    
    if (i == 8) {
      shift(x3, -100);
      image(fly[5], x2, y, z, w);
    }
    if (i == 9) {
      shift(x3, -100);
      image(fly[4], x2, y, z, w);
    }
    if (i == 10) {
      shift(x3, -100);
      image(fly[5], x2, y, z, w);
    }    
    if (i == 11) {
      shift(x3, -100);
      image(fly[6], x2, y, z, w);
    }
    if (i == 12) {
      shift(x3, -100);
      image(fly[5], x2, y, z, w);
    }
    if (i == 13) {
      shift(x3, -100);
      image(fly[4], x2, y, z, w);
    }    
    if (i == 14) {
      shift(x3, -100);
      image(fly[5], x2, y, z, w);
    }
    if (i == 15) {
      shift(x3, -100);
      image(fly[6], x2, y, z, w);
      i = 0;
    }   
    if (i < 14) {
      ++i;
    }
    popMatrix();
  }


  void spawn(int a) {
    pushMatrix();
    scale(1*a, 1);
    tint(255, 255);
    int x2 = x*a;
    int x3 = -40*a;
    int y3 = y2/8;
    if (i == 1) {
      shift(x3, y3);
      image(fly[5], x2, y, z, w);
    }
    if (i == 2) {
      shift(x3, y3);
      image(fly[6], x2, y, z, w);
    }
    if (i == 3) {
      shift(x3, y3);
      image(fly[5], x2, y, z, w);
    }
    if (i == 4) {
      shift(x3, y3);
      image(fly[4], x2, y, z, w);
    }
    if (i == 5) {
      shift(x3, y3);
      image(fly[5], x2, y, z, w);
    }
    if (i == 6) {
      shift(x3, y3);
      image(fly[6], x2, y, z, w);
    }
    if (i == 7) {
      shift(x3, y3);
      image(fly[5], x2, y, z, w);
    }
    if (i == 8) {
      shift(x3, y3);
      image(fly[4], x2, y, z, w);
      i = 0;
    }
    if (i < 8) {
      ++i;
    }
    popMatrix();
  }


  void land(int a) {
    pushMatrix();
    scale(1*a, 1);
    tint(255, 255);
    int x2 = x*a;
    if (i == 1) {
      y = y2;
      image(fly[3], x2, y, z, w);
    }
    if (i == 2) {
      image(fly[2], x2, y, z, w);
    }
    if (i == 3) {
      image(fly[1], x2, y, z, w);
    }    
    if (i == 4) {
      image(fly[0], x2, y, z, w);
      i = 0;
    }      
    if (i < 4) {
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
