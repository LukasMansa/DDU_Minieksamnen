class AddOption implements Scene {

  AddOption() {
  }
  void inizializeControl() {
    cp5.addButton("Back")
    .setPosition(width*0.1,height*0.1)
    .setSize(45,25)
    .setBroadcast(false)
    .setValue(3) //<>//
    .setBroadcast(true)
    ;
   cp5.addButton("Add")
   .setPosition(width*0.5,height*0.5)
   .setSize(45,25)
   ; //<>//
  }
  void removeControl() {
    try {
      cp5.getController("Back").remove();
      cp5.getController("Add").remove();
    }
    catch(Exception e) {
    }
  }
}

public void Add() {
  changeScene(currentScene,3);
}
