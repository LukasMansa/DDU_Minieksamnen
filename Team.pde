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
    headerText1.setText("Hold:");
  }
  void removeControl() {
    try {
      headerText1.remove();
    }
    catch(Exception e) {
    }
  }
}
