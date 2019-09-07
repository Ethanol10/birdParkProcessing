/*
1) Use http://www.beadsproject.net/ to get the audio manipulation you need
2) Bird drawing should be limited to a 50 x 50 px size square.
3) Draw each bird at 0,0 and translate the bird using an xpos and ypos as translate parameters.
4) scale the bird a bit depending how far away the bird is from 0,0. The further away,  the larger the bird is.
5) when spawning a bird, the bird should be within the coordinates where the field will be drawn on the background. By doing so, we don't have birds standing in the sky.
6) spawning a bird should spawn the bird outside the map, then move towards a point where the field is.
7) There should be a function that handles what image to draw for the bird.
*/

class Bird{
  int birdSize; //should be a size from 0 to 2.
  int birdType; //Ideally there should be 10 types of birds. 8 tones and 2 beat sounds
  float xPos;
  float yPos;
  float destinationX;
  float destinationY;
  
//  Bird(){
//    
//  }
  
  //call this function to draw the bird
  void drawBird(){
    rect(0,0,100,100);
  }
  
  //Play the sound from the given birdType and birdSize.
  void playChirp(){
    
  }
  
  //Scale the bird according to how far the bird is away from the top of the screen on the Y axis.
  void scaleBird(){
    
  }
  
  //Function should move xPos to destinationX incrementally, ditto with Y coordinates.
  void moveTowards(){
  
  }
  
  //handles changing what to draw for the bird.
  void drawBirdAnimationFrame(){
    
  }
}
