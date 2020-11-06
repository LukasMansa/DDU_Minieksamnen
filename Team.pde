class Team implements Scene {
  Textarea headerText1;

  void inizializeControl() {
     cp5.addButton("Back")
      .setPosition(width*0.1, height*0.1)
      .setSize(45, 25)
      .setBroadcast(false)
      .setValue(5)
      .setBroadcast(true)
      ;
    this.headerText1 = cp5.addTextarea("")
      .setPosition(width/2-100, 100)
      .setSize(200, 200)
      .setFont(createFont("arial", 50))
      .setLineHeight(12)
      .setColor(color(128))
      ;
    cp5.addButton("Logout")
      .setPosition(width*0.9, 75)
      .setSize(75, 25)
      ;
    headerText1.setText("Hold:");
    
     cp5.addButton("Tilføj")  //Her skal addOption implementeres
      .setPosition(width/2-100, height/2+150)
      .setSize(75, 25)
      ;
  }
  void removeControl() {
    try {
      headerText1.remove();
      cp5.getController("Back").remove();
      cp5.getController("Logout").remove();
      cp5.getController("Tilføj").remove();
    }
    catch(Exception e) {
    }
  }
}
