class AddQuestion implements Scene {
  Textarea headerText1;

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
    cp5.addTextfield("Spørgsmål:")
      .setPosition(width/2 - 100, 225)
      .setSize(200, 40)
      .setFocus(true)
      .setColor(color(#ebebeb))
      .setColorCaptionLabel(color(#4e4f4a))
      ;
    this.headerText1 = cp5.addTextarea("")
      .setPosition(width/2-100, 100)
      .setSize(200, 200)
      .setFont(createFont("arial", 24))
      .setLineHeight(12)
      .setColor(color(128))
      ;
    headerText1.setText("Opret spørgsmål"); 


    cp5.addButton("Valgmulighed")  //Her skal addOption implementeres
      .setPosition(width/2-100, height/2-100)
      .setSize(75, 25)
      ;
    cp5.addButton("Opret")  //Her skal addOption implementeres
      .setPosition(width/2-100, height/2-50)
      .setSize(75, 25)
      ;
  }
  void removeControl() {
    try {
      cp5.getController("Logout").remove();
      cp5.getController("Back").remove();
      cp5.getController("Spørgsmål:").remove();
      cp5.getController("Valgmulighed").remove();
      cp5.getController("Opret").remove();
      headerText1.remove();
    }
    catch(Exception e) {
    }
  }
}
