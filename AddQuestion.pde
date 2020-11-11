int isMultipleChoice = 0;  //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
RadioButton MultipleChoiceButton;
RadioButton CorrectAnswer;
class AddQuestion implements Scene { 
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
      .setPosition(width/2 - 100, 225)
      .setSize(200, 40)
      .setFocus(true)
      .setColor(color(#ebebeb))
      .setColorCaptionLabel(color(#4e4f4a))
      ;

    cp5.addButton("Create")  //Her skal addOption implementeres
      .setPosition(width/2-100, height/2+200)
      .setSize(75, 25)
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
    //<>//
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

void controlEvent(ControlEvent theEvent) { //TODO: Move from AddQuestion to a more general place. This function is called several places
  if (theEvent.isFrom(MultipleChoiceButton)) { 
    if (MultipleChoiceButton.getState(0)==true) {
      cp5.getController("Svar").remove();
      cp5.addTextfield("Svar1")
        .setPosition(width/2-200, 400)
        .setSize(200, 40)
        .setColor(color(#ebebeb)) //<>//
        .setColorCaptionLabel(color(#4e4f4a))
        ;
      cp5.addTextfield("Svar2")
        .setPosition(width/2+20, 400)
        .setSize(200, 40)
        .setColor(color(#ebebeb))
        .setColorCaptionLabel(color(#4e4f4a))
        ;
      cp5.addTextfield("Svar3")
        .setPosition(width/2-200, 475)
        .setSize(200, 40)
        .setColor(color(#ebebeb))
        .setColorCaptionLabel(color(#4e4f4a))
        ;
      cp5.addTextfield("Svar4")
        .setPosition(width/2+20, 475)
        .setSize(200, 40)
        .setColor(color(#ebebeb))
        .setColorCaptionLabel(color(#4e4f4a))
        ;
      if (CorrectAnswer == null) {
        CorrectAnswer = cp5.addRadioButton("CorrectAnswer")
          .setPosition(width/2-230, 410)
          .setSize(20, 20)
          .setColorForeground(color(#161759))
          .setColorActive(color(#435c27))
          .setColorLabel(color(#ebebeb))
          .setItemsPerRow(2)
          .setSpacingColumn(440)
          .setSpacingRow(55)
          .addItem("0", 0)
          .addItem("1", 1)
          .addItem("2", 2)
          .addItem("3", 3)
          ;
      } else {
        CorrectAnswer.addItem("0", 0);
        CorrectAnswer.addItem("1", 1);
        CorrectAnswer.addItem("2", 2);
        CorrectAnswer.addItem("3", 3);
      }
    } else {
      cp5.getController("Svar1").remove();
      cp5.getController("Svar2").remove();
      cp5.getController("Svar3").remove();
      cp5.getController("Svar4").remove(); 
      CorrectAnswer.removeItem("0");
      CorrectAnswer.removeItem("1");
      CorrectAnswer.removeItem("2");
      CorrectAnswer.removeItem("3");

      cp5.addTextfield("Svar")
        .setPosition(width/2 - 100, 400)
        .setSize(200, 40)
        .setColor(color(#ebebeb))
        .setColorCaptionLabel(color(#4e4f4a))
        ;
    }
    if(MultipleChoiceButton.getState(0)== false) {
          isMultipleChoice = 0;
    } else {
      isMultipleChoice = 1;
    }

  }
  for (int i = 0; i<classes.size(); i++) {
    if (theEvent.isFrom("class"+classes.get(i))) {
      selectedTeam = classes.get(i);
      if (queries.size() == 0) {
        queries.add("INSERT INTO Tests (TestName, Status, Class) VALUES (" + db.escape(testName) + ", 0, " + db.escape(selectedTeam) + ")");
      } else {
        queries.removeFirst();
        queries.addFirst("INSERT INTO Tests (TestName, Status, Class) VALUES (" + db.escape(testName) + ", 0, " + db.escape(selectedTeam) + ")");
      }
      changeScene(currentScene, 4);
    }
  }
}

public void Create() {
  String questionName = cp5.get(Textfield.class, "Spørgsmål:").getText();
  String correctAnswer = "";
  String query = "SELECT * FROM Tests";
  int testId = 1;
  db.query(query);
  while(db.next()) {
    testId++;
  }
  if (isMultipleChoice == 1) {
    String answer1 = cp5.get(Textfield.class, "Svar1").getText();
    String answer2 = cp5.get(Textfield.class, "Svar2").getText();
    String answer3 = cp5.get(Textfield.class, "Svar3").getText();
    String answer4 = cp5.get(Textfield.class, "Svar4").getText();

    for (int i = 0; i<4; i++) {
      if (CorrectAnswer.getState(i) == true) {
        correctAnswer = cp5.get(Textfield.class, "Svar"+(i+1)).getText();
      }
    }
    queries.add("INSERT INTO Questions (QuestionName, Answer1, Answer2, Answer3, Answer4, CorrectAnswer, IsMultipleChoice, TestId) VALUES (" + db.escape(questionName) +  ", " + db.escape(answer1) + ", " + db.escape(answer2) + ", " + db.escape(answer3) + ", " + db.escape(answer4) + ", " + db.escape(correctAnswer) + ", " + isMultipleChoice + ", " + testId + ")");
    changeScene(currentScene, 4);
  } else {
    correctAnswer = cp5.get(Textfield.class, "Svar").getText();
    queries.add("INSERT INTO Questions (QuestionName, CorrectAnswer, IsMultipleCHoice, TestId) VALUES (" + db.escape(questionName) + ", " + db.escape(correctAnswer) + ", " + isMultipleChoice + ", " + testId + ")");
    changeScene(currentScene, 4);
  }
}
