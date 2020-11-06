class AddQuestion implements Scene { //<>// //<>// //<>//
  Textarea headerText1;

  void inizializeControl() {
    cp5.addButton("Back")
      .setPosition(width*0.1, height*0.1)
      .setSize(45, 25)
      .setBroadcast(false)
      .setValue(4)
      .setBroadcast(true)
      ;
    cp5.addButton("Logout")
      .setPosition(width*0.9, 75)
      .setSize(75, 25)
      ;
    cp5.addButton("Valgmulighed")  //Her skal addOption implementeres
      .setPosition(width/2-100, height/2-100)
      .setSize(75, 25)
      ;
    cp5.addTextfield("Spørgsmål:")
      .setPosition(width/2 - 100, 225)
      .setSize(200, 40)
      .setFocus(true)
      .setColor(color(#ebebeb))
      .setColorCaptionLabel(color(#4e4f4a))
      ;
    
    cp5.addButton("Opret")  //Her skal addOption implementeres
      .setPosition(width/2-100, height/2-50)
      .setSize(75, 25)
      ;
      
    this.headerText1 = cp5.addTextarea("txt")
      .setPosition(width/2-100, 100)
      .setSize(200, 50)
      .setFont(createFont("arial", 24))
      .setLineHeight(12)
      .setColor(color(128))
      ;
    headerText1.setText("Opret spørgsmål");
  }
  
  void removeControl() {
    try {
      cp5.getController("Logout").remove(); //<>//
      cp5.getController("Back").remove(); //<>//
      cp5.getController("Spørgsmål:").remove(); //<>//
            cp5.getController("Valgmulighed").remove(); //<>//
            cp5.getController("Opret").remove();
      headerText1.remove(); //<>//
      cp5.getController("txt").remove(); //<>//


  }
}
public void Valgmulighed() { //Her skal man sendes over til AddOption og derefter komme tilbage til AddQuestion.
  changeScene(currentScene, 6);
}
