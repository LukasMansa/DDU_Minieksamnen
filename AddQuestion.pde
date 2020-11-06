String questionName = ""; //<>// //<>// //<>//
boolean isMultipleChoice = false;
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

    cp5.addTextfield("Spørgsmål:")
      .setText(questionName)
      .setPosition(width/2 - 100, 225)
      .setSize(200, 40)
      .setFocus(true)
      .setColor(color(#ebebeb))
      .setColorCaptionLabel(color(#4e4f4a))
      ;
    cp5.addButton("SaveQuestionName")
      .setCaptionLabel("Gem Navn")
      .setPosition(width/2+120,225)
      .setSize(100,40)
      ;
    cp5.addButton("Opret")  //Her skal addOption implementeres
      .setPosition(width/2-100, height/2+200)
      .setSize(75, 25)
      ;
      
    cp5.addRadioButton("MultipleChoice")
    .setPosition(width/2-100,300) //<>//
    .setSize(20,20) //<>//
    ; //<>//
if(isMultipleChoice) { //<>//
  cp5.addTextfield("Svar1") //<>//
    .setPosition(width/2-200,300) //<>//
    .setSize(200,40)
    .setColor(color(#ebebeb)) //<>// //<>//
    .setColorCaptionLabel(color(#4e4f4a))
    ;
  cp5.addTextfield("Svar2")
    .setPosition(width/2+20,300)
    .setSize(200,40)
    .setColor(color(#ebebeb))
    .setColorCaptionLabel(color(#4e4f4a))
    ;
  cp5.addTextfield("Svar3")
    .setPosition(width/2-200,375)
    .setSize(200,40)
    .setColor(color(#ebebeb))
    .setColorCaptionLabel(color(#4e4f4a))
    ;
  cp5.addTextfield("Svar4")
    .setPosition(width/2+20,375)
    .setSize(200,40)
    .setColor(color(#ebebeb))
    .setColorCaptionLabel(color(#4e4f4a))
    ;
} else {
  cp5.addTextfield("Svar")
    .setPosition(width/2 - 100, 400)
    .setSize(200,40)
    .setColor(color(#ebebeb))
    .setColorCaptionLabel(color(#4e4f4a))
    ;
}
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
      cp5.getController("SaveQuestionName").remove();
      headerText1.remove(); //<>//
      cp5.getController("txt").remove(); //<>//
    } 
    catch(Exception e) {
    }
  }
}

public void SaveQuestionName() {
  questionName = cp5.get(Textfield.class, "Spørgsmål:").getText();
}
