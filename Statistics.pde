class Statistics implements Scene {
  Textarea headerText1;

  void inizializeControl() {
    cp5.addButton("Back")
      .setCaptionLabel("Tilbage")
      .setFont(createFont("arial", 10))
      .setPosition(width*0.1, height*0.1)
      .setSize(75, 25)
      .setBroadcast(false) //<>//
      .setValue(3) //<>//
      .setBroadcast(true)
      ;
    this.headerText1 = cp5.addTextarea("ht1")
      .setPosition(width/2-250, 100)
      .setSize(2000, 2000)
      .setFont(createFont("arial", 40))
      .setLineHeight(12)
      .setColor(color(128))
      ;
    headerText1.setText("Statestik af elvers resultater");

    cp5.addButton("Logout")
      .setCaptionLabel("Log ud")
      .setFont(createFont("arial", 10))
      .setPosition(width*0.9, 75) //<>//
      .setSize(75, 25)
      ;
  }
  void removeControl() {
    try {
      cp5.getController("Logout").remove();
      cp5.getController("Back").remove();
      cp5.getController("").remove();
      headerText1.remove();
    }
    catch(Exception e) {
    }
  }
}
