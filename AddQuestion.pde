class AddQuestion implements Scene {
  Textarea headerText;

  void inizializeControl() {
    cp5.addButton("logout")
      .setPosition(width*0.9, 75)
      .setSize(75, 25)
      ;
    cp5.addTextfield("Spørgsmål:")
      .setPosition(width/2 - 100, 225)
      .setSize(200, 40)
      .setFocus(true)
      .setColor(color(#ebebeb))
      .setColorCaptionLabel(color(#4e4f4a))
      ;
    this.headerText = cp5.addTextarea("txt")
      .setPosition(100, 100)
      .setSize(200, 200)
      .setFont(createFont("arial", 12))
      .setLineHeight(14)
      .setColor(color(128))
      ;
    headerText.setText("Opret spørgsmål"); 


    this.headerText = cp5.addTextarea("txt")
      .setPosition(width*0.9-100, 75)
      .setSize(75, 25)
      .setFont(createFont("arial", 12))
      .setLineHeight(14)
      .setColor(color(128))
      ;
    headerText.setText("Lærer");


    cp5.addButton("Valgmulighed")
      .setPosition(width/2-150, height/2-100)
      .setSize(75, 25)
      ;
  }
  void removeControl() {
    try {
      cp5.getController("Logout").remove();
      cp5.getController("Spørgsmål:").remove();
      cp5.getController("Opret valgmulighed").remove();
    }
    catch(Exception e) {
    }
  }
}
