class AddOption implements Scene {

  AddOption() {
  }
  void inizializeControl() {
    cp5.addButton("Back")
    .setPosition(width*0.1,height*0.1)
    .setSize(45,25)
    .setBroadcast(false)
    .setValue(5)
    .setBroadcast(true)
    ;
  }
  void removeControl() {
    try {
      cp5.getController("Back").remove();
    }
    catch(Exception e) {
    }
  }
}
