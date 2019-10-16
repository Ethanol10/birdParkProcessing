class ListHandler {
  ArrayList<UIList> lists;


  ListHandler(ArrayList<String> inpList, int inpX, int inpY) {
    lists = new ArrayList<UIList>();
    lists.add( new UIList(inpList, inpX, inpY) );
  }

  void drawLists() {
    for (int i = 0; i < lists.size(); i++) {
      lists.get(i).drawUIList();
    }
  }

  void addList(ArrayList<String> inpList) {
    int lastListX;
    int lastListY;

    lastListX = lists.get(lists.size() - 1).xPos;
    lastListY = lists.get(lists.size() - 1).yPos;

    lists.add(new UIList(inpList, lastListX + (int)lists.get(lists.size() - 1).headerSize +40 , lastListY ));
  }
  
  String checkCollision(){
    String result;
    
    for (int i = 0; i < lists.size (); i++) {
      result = lists.get(i).detectPosition(mouseX, mouseY, lists.get(i).xPos, lists.get(i).yPos, lists.get(i).textHeight * lists.get(i).buttonList.size(), lists.get(i).largestWidth);
      if(result != "n/a"){
        return result;
      }
    }
    
    return "error";
  }
}

