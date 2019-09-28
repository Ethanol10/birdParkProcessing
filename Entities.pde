class Entities{
  ArrayList <Food> food;
  ArrayList <MakeBird> birds;
  
  Entities(){
    
  }
  
  //Draw entities
  void drawEntities(){
    
  }
  
  //MakeBird has a bird within its class. make a method that allows entities to read those birds and pass relevant 
  //information to food within this class.`
  
  //Check if the point p is anywhere within a circle with point c and radius r.
  boolean isOverCircle(float px, float py, float cx, float cy, float r) {
    float distX = px - cx;
    float distY = py - cy;
    float distance = sqrt( (distX*distX) + (distY*distY) );
  
    if (distance <= r) {
      return true;
    }
    return false;
  }
  
  //Return distance between point 1 and point 2
  float distanceBetweenPoints(float x1, float y1, float x2, float y2){
    float distX = x1 - x2;
    float distY = y1 - y2;
    
    return sqrt( (distX*distX) + (distY*distY) );
  }
  
}
