boolean drawFood = true;
boolean drawInstructions = true;

ArrayList<Food> foods;
int foodWidth = 20;

void setup(){
 size(1280, 720); 
 foods = new ArrayList<Food>();
}

void draw(){
  background(230, 255, 242);

  if(drawFood){
    for (int i = foods.size()-1; i >= 0; i--) { 
      Food food = foods.get(i);
      food.display();
    } 
  }
  if(drawInstructions){
    pushMatrix();
      fill(0);
      String s = "Press 'f' to draw food \nPress 'i' to open and close these instructions";
      text(s, 10, 20);     
    popMatrix();
   }
}

void keyPressed(){
  if(key == 'i'){
    drawInstructions = !drawInstructions;
  }
  if(key == 'f'){
    drawFood = !drawFood;
  }
}

void mousePressed() {
  foods.add(new Food(mouseX, mouseY, foodWidth));
}
