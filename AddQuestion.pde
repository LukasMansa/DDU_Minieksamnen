class AddQuestion implements Scene { //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
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
    cp5.addButton("Logout")
      .setCaptionLabel("Log ud")
      .setFont(createFont("arial", 10))
      .setPosition(width*0.9, 75) //<>//
      .setSize(75, 25)
      ;
    cp5.addButton("Option")  //Her skal addOption implementeres
      .setCaptionLabel("Valgmulighed")
      .setFont(createFont("arial", 8))
      .setPosition(width/2-100, height/2-100)
      .setSize(75, 25)
      ;
    cp5.addTextfield("Question")
      .setCaptionLabel("Spørgsmål:")
      .setPosition(width/2 - 100, 225)
      .setFont(createFont("arial", 10))
      .setSize(200, 40)
      .setFocus(true)
      .setColor(color(#ebebeb))
      .setColorCaptionLabel(color(#4e4f4a))
      ;

    cp5.addButton("Add")  //Her skal addOption implementeres
      .setCaptionLabel("Opret")
      .setPosition(width/2-100, height/2-50)
      .setFont(createFont("arial", 10))
      .setSize(75, 25)
      ;

    this.headerText1 = cp5.addTextarea("txt")
      .setPosition(width/2-100, 100)
      .setSize(200, 50)
      .setFont(createFont("arial", 24))
      .setLineHeight(12)
      .setColor(color(128)) //<>//
      ; //<>//
    headerText1.setText("Opret spørgsmål"); //<>//
  } //<>//
  //<>//
  void removeControl() { //<>//
    try {
      cp5.getController("Logout").remove(); //<>// //<>// //<>//
      cp5.getController("Back").remove(); //<>//
      cp5.getController("Question").remove(); //<>//
      cp5.getController("Option").remove(); //<>//
      cp5.getController("Add").remove();
      headerText1.remove(); //<>//
      cp5.getController("txt").remove(); //<>//
    } 
    catch(Exception e) {
    }
  }
}
public void Valgmulighed() { //Her skal man sendes over til AddOption og derefter komme tilbage til AddQuestion.
  changeScene(currentScene, 6);
}
