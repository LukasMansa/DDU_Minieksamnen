class Team implements Scene {
  Textarea headerText1;

  void inizializeControl() {
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
  }
  void removeControl() {
    try {
      headerText1.remove();
      cp5.getController("Logout").remove();
    }
    catch(Exception e) {
    }
  }
}
