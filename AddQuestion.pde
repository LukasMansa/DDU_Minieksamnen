
int isMultipleChoice = 0;
RadioButton MultipleChoiceButton;
RadioButton CorrectAnswer;
class AddQuestion implements Scene { 
  Textarea headerText1;

  void inizializeControl() {
    cp5.addButton("Back")
      .setCaptionLabel("Tilbage")
      .setPosition(width*0.1, height*0.1)
      .setSize(50, 30)
      .setBroadcast(false)
      .setValue(4)
      .setBroadcast(true)
      .setColorBackground(0xff161759)
      ;

    cp5.addButton("Logout")
      .setCaptionLabel("Log ud")
      .setPosition(width*0.9, 75)
      .setSize(100, 50)
      .setColorBackground(0xff161759)
      ;

    cp5.addTextfield("Spørgsmål:")
      .setPosition(width/2 - 100, 225)
      .setSize(200, 40)
      .setFocus(true)
      .setColor(color(#ebebeb))
      .setColorCaptionLabel(color(#4e4f4a))
      ;

    cp5.addButton("Create")  //Her skal addOption implementeres
      .setCaptionLabel("Opret")
      .setPosition(width/2-100, height/2+200)
      .setSize(100, 50)
      .setColorBackground(0xff161759)
      ;

    MultipleChoiceButton = cp5.addRadioButton("MultipleChoice")
      .setPosition(width/2-100, 300)
      .setSize(40, 20)
      .setColorForeground(color(#ff3636))
      .setColorBackground(color(#ff3636))
      .setColorActive(color(#435c27))
      .setColorLabel(color(#4e4f4a))
      
      .setItemsPerRow(2)
      .setSpacingColumn(100)
      .setSpacingRow(50)
      .addItem("Is this multiple choice?", 0)
      ;

    cp5.addTextfield("Svar")
      .setPosition(width/2 - 100, 400)
      .setSize(200, 40)
      .setColor(color(#ebebeb))
      .setColorCaptionLabel(color(#4e4f4a))
      ;

    this.headerText1 = cp5.addTextarea("Title")
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
      cp5.getController("Logout").remove();
      cp5.getController("Back").remove();
      cp5.getController("Spørgsmål:").remove();
      cp5.getController("Create").remove();
      headerText1.remove();
      MultipleChoiceButton.remove();


      if (isMultipleChoice == 0) {
        cp5.getController("Svar").remove();
      } else {
        cp5.getController("Svar1").remove();
        cp5.getController("Svar2").remove();
        cp5.getController("Svar3").remove();
        cp5.getController("Svar4").remove(); 
        CorrectAnswer.removeItem("0");
        CorrectAnswer.removeItem("1");
        CorrectAnswer.removeItem("2");
        CorrectAnswer.removeItem("3");
        isMultipleChoice = 0;
      }
    } 
    catch(Exception e) {
    }
  }
}
