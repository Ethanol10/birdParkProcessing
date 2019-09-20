class Bird {
  PImage [] peck;
  PImage [] hop;
  PImage [] chirp;
  PImage [] fly;
  int i;

  int x;
  int y;
  int x2;
  int y2;

  float scale;


  Bird(int x, int y, String colour) {
    scale = 0.15 + (float)y/2000;
    this.x = (int)(x/scale);
    this.y = (int)(y/scale);
    x2 = this.x; //save original x position
    y2 = this.y; //save original y position

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
    i = 1;
  }


  void peckLeft() { 
    pushMatrix();
    scale(scale, scale);
    if (i > 0 && i <= 5) {
      image(peck[0], x, y);
    }
    if (i == 6) {
      image(peck[1], x, y);
    }
    if (i == 7) {
      image(peck[2], x, y);
    }
    if (i == 8) {
      image(peck[3], x, y);
    }    
    if (i == 9) {
      image(peck[4], x, y);
    }  
    if (i == 10) {
      image(peck[3], x, y);
    }  
    if (i == 11) {
      image(peck[2], x, y);
    }  
    if (i == 12) {
      image(peck[1], x, y);
    }  
    if (i >= 13 && i < 20) {
      image(peck[0], x, y);
    }  
    if (i >= 20) {
      image(peck[0], x, y);
      i = 0;
    }
    if (i < 20 && i > 0) {
      ++i;
    }
    popMatrix();
  }

  void peckRight() { 
    pushMatrix();
    scale(-scale, scale);
    if (i > 0 && i <= 5) {
      image(peck[0], -x, y);
    }
    if (i == 6) {
      image(peck[1], -x, y);
    }
    if (i == 7) {
      image(peck[2], -x, y);
    }
    if (i == 8) {
      image(peck[3], -x, y);
    }    
    if (i == 9) {
      image(peck[4], -x, y);
    }  
    if (i == 10) {
      image(peck[3], -x, y);
    }  
    if (i == 11) {
      image(peck[2], -x, y);
    }  
    if (i == 12) {
      image(peck[1], -x, y);
    }  
    if (i >= 13 && i < 20) {
      image(peck[0], -x, y);
    }  
    if (i >= 20) {
      image(peck[0], -x, y);
      i = 0;
    }
    if (i < 20 && i > 0) {
      ++i;
    }
    popMatrix();
  }


  void hopLeft() {
    pushMatrix();
    scale(scale, scale);
    if (i == 1) {
      image(hop[0], x, y);
    }
    if (i == 2) {
      image(hop[1], x, y);
    }
    if (i == 3) {
      shift(-100, -100);
      image(hop[2], x, y);
    }    
    if (i == 4) {
      shift(-100, 50);
      image(hop[3], x, y);
    }    
    if (i == 5) {
      shift(0, 50);
      image(hop[1], x, y);
    }  
    if (i == 6) {
      image(hop[0], x, y);
      i = 0;
    }  
    if (i < 6) {
      ++i;
    }
    popMatrix();
  }

  void hopRight() {
    pushMatrix();
    scale(-scale, scale);
    if (i == 1) {
      image(hop[0], -x, y);
    }
    if (i == 2) {
      image(hop[1], -x, y);
    }
    if (i == 3) {
      shift(100, -100);
      image(hop[2], -x, y);
    }    
    if (i == 4) {
      shift(100, 50);
      image(hop[3], -x, y);
    }    
    if (i == 5) {
      shift(0, 50);
      image(hop[1], -x, y);
    }  
    if (i == 6) {
      image(hop[0], -x, y);
      i = 0;
    }  
    if (i < 6) {
      ++i;
    }
    popMatrix();
  }


  void chirpLeft() {
    pushMatrix();
    scale(scale, scale);
    image(chirp[1], x, y);
    popMatrix();
  }

  void chirpRight() {
    pushMatrix();
    scale(-scale, scale);
    image(chirp[2], -x, y);
    popMatrix();
  }


void standLeft() {
    pushMatrix();
    scale(scale, scale);
    image(peck[0], x, y);
    popMatrix();
  }

  void standRight() {
    pushMatrix(); 
    scale(-scale, scale);
    image(peck[0], -x, y);
    popMatrix();
  }


  void takeOffLeft() {
    pushMatrix();
    scale(scale, scale);
    if (i == 1) {
      image(fly[0], x, y);
    }
    if (i == 2) {
      image(fly[1], x, y);
    }
    if (i == 3) {
      image(fly[2], x, y);
    }    
    if (i == 4) {
      image(fly[3], x, y);
      i = 0;
    }      
    if (i < 4) {
      ++i;
    }
    popMatrix();
  }

  void takeOffRight() {
    pushMatrix();
    scale(-scale, scale);
    if (i == 1) {
      image(fly[0], -x, y);
    }
    if (i == 2) {
      image(fly[1], -x, y);
    }
    if (i == 3) {
      image(fly[2], -x, y);
    }    
    if (i == 4) {
      image(fly[3], -x, y);
      i = 0;
    }      
    if (i < 4) {
      ++i;
    }
    popMatrix();
  }


  void flyLeft() {
    pushMatrix();
    scale(scale, scale);
    if (i == 1) {
      shift(-200, -400);
      image(fly[4], x, y);
    }    
    if (i == 2) {
      shift(-200, -400);
      image(fly[5], x, y);
    }
    if (i == 3) {
      shift(-200, -400);
      image(fly[6], x, y);
    }
    if (i == 4) {
      shift(-200, -400);
      image(fly[5], x, y);
    }    
    if (i == 5) {
      shift(-200, -400);
      image(fly[4], x, y);
    }
    if (i == 6) {
      shift(-200, -400);
      image(fly[5], x, y);
    }
    if (i == 7) {
      shift(-200, -400);
      image(fly[6], x, y);
    }    
    if (i == 8) {
      shift(-200, -400);
      image(fly[5], x, y);
    }
    if (i == 9) {
      shift(-200, -400);
      image(fly[4], x, y);
    }
    if (i == 10) {
      shift(-200, -400);
      image(fly[5], x, y);
    }    
    if (i == 11) {
      shift(-200, -400);
      image(fly[6], x, y);
    }
    if (i == 12) {
      shift(-200, -400);
      image(fly[5], x, y);
    }
    if (i == 13) {
      shift(-200, -400);
      image(fly[4], x, y);
    }    
    if (i == 14) {
      shift(-200, -400);
      image(fly[5], x, y);
      i = 0;
    }
    if (i == 15) {
      shift(-200, -400);
      image(fly[6], x, y);
    }   
    if (i < 14) {
      ++i;
    }
    popMatrix();
  }


  void flyRight() {
    pushMatrix();
    scale(-scale, scale);
    if (i == 1) {
      shift(200, -400);
      image(fly[4], -x, y);
    }
    if (i == 2) {
      shift(200, -400);
      image(fly[5], -x, y);
    }    
    if (i == 3) {
      shift(200, -400);
      image(fly[6], -x, y);
    }
    if (i == 4) {
      shift(200, -400);
      image(fly[5], -x, y);
    }
    if (i == 5) {
      shift(200, -400);
      image(fly[4], -x, y);
    }    
    if (i == 6) {
      shift(200, -400);
      image(fly[5], -x, y);
    }
    if (i == 7) {
      shift(200, -400);
      image(fly[6], -x, y);
    }
    if (i == 8) {
      shift(200, -400);
      image(fly[5], -x, y);
    }    
    if (i == 9) {
      shift(200, -400);
      image(fly[4], -x, y);
    }
    if (i == 10) {
      shift(200, -400);
      image(fly[5], -x, y);
    }
    if (i == 11) {
      shift(200, -400);
      image(fly[6], -x, y);
    }    
    if (i == 12) {
      shift(200, -400);
      image(fly[5], -x, y);
    }
    if (i == 13) {
      shift(200, -400);
      image(fly[4], -x, y);
    }
    if (i == 14) {
      shift(200, -400);
      image(fly[5], -x, y);
    }    
    if (i == 15) {
      shift(200, -400);
      image(fly[6], -x, y);
      i = 0;
    }   
    if (i < 14) {
      ++i;
    }
    popMatrix();
  }

/*
  void spawnLeft() {
    pushMatrix();
    int a = (y2+150)/15;
    scale(scale, scale);
    if(i == 1){
      y = -150;
      image(fly[6], x, y);
    }
    if(i == 2){
      
    }
    popMatrix();
  }


  void spawnRight() {
    pushMatrix();
    scale(-scale, scale);
    popMatrix();
  }


  void landLeft() {
    pushMatrix();
    scale(-scale, scale);
    if (i == 1) {
      image(fly[3], -x, y);
    }
    if (i == 2) {
      image(fly[2], -x, y);
    }
    if (i == 3) {
      image(fly[1], -x, y);
    }
    if (i == 4) {
      image(fly[0], -x, y);
      i = 0;
    }
    if (i < 4) {
      ++i;
    }
    popMatrix();
  }


  void landRight() {
    pushMatrix();
    scale(scale, scale);
    if (i == 1) {
      image(fly[3], x, y);
    }
    if (i == 2) {
      image(fly[2], x, y);
    }
    if (i == 3) {
      image(fly[1], x, y);
    }
    if (i == 4) {
      image(fly[0], x, y);
      i = 0;
    }
    if (i < 4) {
      ++i;
    }
    popMatrix();
  }
*/

  void shift(int x, int y) {
    this.x += x*scale;
    this.y += y*scale;
  }


  int limitX(int boundary) {
    int limit = (int)((x*scale) + (boundary*scale));
    return limit;
  }


  int limitY(int boundary) {
    int limit = (int)((y*scale) + (boundary*scale));
    return limit;
  }
}

