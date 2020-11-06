class AddOption implements Scene {
  Textarea headerText1;

  AddOption() {
  }
  void inizializeControl() {
    cp5.addButton("Back")
      .setPosition(width*0.1, height*0.1)
      .setSize(45, 25)
      .setBroadcast(false)
      .setValue(5)
      .setBroadcast(true)
      ;
    cp5.addButton("Logout")
      .setPosition(width*0.9, 75)
      .setSize(75, 25)
      ;
    this.headerText1 = cp5.addTextarea("ht1")
      .setPosition(width/2-150, 150)
      .setSize(2000, 2000)
      .setFont(createFont("arial", 32))
      .setLineHeight(12)
      .setColor(color(128))
      ;
    headerText1.setText("Tilføj Valgmulighed:");

    cp5.addButton("Tilføj")  //Her skal addOption implementeres
      .setPosition(width/2-100, height/2-50)
      .setSize(75, 25)
      ;
  }
  void removeControl() {
    try {
      cp5.getController("Back").remove();
      cp5.getController("Logout").remove();
      cp5.getController("Tilføj").remove();
      headerText1.remove();
    }
    catch(Exception e) {
    }
  }
}
