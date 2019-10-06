/*
  Have functions that return booleans based on what has been clicked. The background should 
  call these functions and perform any sort of function based on what ever was checked.
  This class creates a list of text. The first element is the top of the list, and the rest
  is spawned underneath when the cursor is above the text.
*/

//FOR LATER
/*
  Create a list where the top is the first element in button list. The collision box should be
  the size of the text of one element. ONCe the user has their cursor above the text, expand
  the collision to be the size of the width of one button, but the size of 1* the number of 
  buttons in the list. Shrink the box when the user's mouse moves away from the enlarged collision
  box.
*/
class UIList{  
  
  //User Interface stuff
  ArrayList<String> buttonList;
  float largestWidth;
  float textHeight;
  int xPos;
  int yPos;
  boolean isExpanded;
  int textSizeVar = 15;
  
  UIList(ArrayList<String> inpButtonList, int inpX, int inpY){
    xPos = inpX;
    yPos = inpY;
    buttonList = inpButtonList;
    isExpanded = false;
    textSize(textSizeVar);
    largestWidth = textWidth(buttonList.get(0));
    textHeight = textAscent();
    for(int i = 0; i < buttonList.size(); i++){
      if(largestWidth <= textWidth(buttonList.get(i))){
        largestWidth = textWidth(buttonList.get(i));
      }
    }
  }
  
  void drawUIList(){
    fill(255);
    if(isExpanded){
      pushMatrix();
        
        textSize(textSizeVar);
        text(buttonList.get(0), xPos, yPos);
        for(int i = 1; i < buttonList.size(); i++){
          text(buttonList.get(i), xPos, yPos + (textHeight * i));
        }
        isExpanded = checkCollision(mouseX, mouseY, xPos, yPos,textHeight * buttonList.size(), largestWidth);
      popMatrix();  
    }
    else{
      pushMatrix();
        textSize(textSizeVar);
        text(buttonList.get(0), xPos, yPos);
        isExpanded = checkStartCollision(mouseX, mouseY, xPos, yPos, textHeight, largestWidth);
      popMatrix();
    }
    
  }
  
  String detectPosition(){
    return "lmao";
  }
  
  boolean checkCollision(int px, int py, int x, int y, float colHeight, float colWidth){
    //if px is within the width of the box and py is in the height of the box
    if( (px >= x && px <= x + colWidth) && (py >= y - textHeight && py <= (y - textHeight) + colHeight) ){
      return true;
    }
    return false;
  }
  
  boolean checkStartCollision(int px, int py, int x, int y, float colHeight, float colWidth){
    //if px is within the width of the box and py is in the height of the box
    if( (px >= x && px <= x + colWidth) && (py >= y - colHeight && py <= y) ){
      return true;
    }
    return false;
  }
}
