public class TakeTest implements Scene {

  RadioButton RB;

  int testID;
  Textarea testTitle;
  Textarea theQuestion;

  TakeTest(int _testID) {
    this.setID(_testID);
  }

  TakeTest() {
    this.testID= 0;
  }

  void setID(int _testID) {
    this.testID = _testID;
  }

  void inizializeControl() {

    // the user cannot go back. They may only end the test 
    //cp5.addButton("Back")
    //  .setPosition(width*0.1, height*0.1)
    //  .setSize(45, 25)
    //  .setBroadcast(false)
    //  .setValue(1)
    //  .setBroadcast(true)
    //  ;

    // the user cannot logout. They may only end the test 
    //cp5.addButton("Logout") 
    //  //.setFont(createFont("arial", 18))
    //  .setPosition(width*0.9, 75)
    //  .setSize(75, 25)
    //  ;


    cp5.addButton("Afslut")
      //.setFont(createFont("arial", 18))
      .setPosition(width*0.9, 125)
      .setSize(100, 50)
      .setColorBackground(0xff161759)
      ;

    testTitle = cp5.addTextarea("txt")
      .setPosition(100, 150)
      .setSize(600, 50)
      .setFont(createFont("arial", 42))
      .setLineHeight(14)
      .setColor(color(#4e4f4a))
      ;

    { 
      String query = "SELECT * FROM Tests WHERE TestId='" + this.testID + "'";
      db.query(query);
      //printArray(db.getTableNames());

      testTitle.setText(db.getString("TestName"));

      query = "SELECT * FROM Questions WHERE TestId='" + this.testID + "'";
      db.query(query);
      try {
        inizializeQuestion();
      }
      catch(Exception e) {
      }
    }
  }

  void removeControl() {
    try {
      this.removeQuestion();
      theQuestion.remove();
      //cp5.getController("Logout").remove();
      //cp5.getController("Back").remove(); 
      cp5.getController("Afslut").remove(); 
      testTitle.remove();
      cp5.getController("nextQuestion").remove();
      this.removeQuestion();
      removeRadio();
      cp5.getController("Answer0").remove();
    }
    catch(Exception e) {
      println("Failure removing all controllers: " + e);
    }
  }

  void inizializeQuestion() {
    if (db.next()) {
      try {
        cp5.addButton("nextQuestion")
          .setPosition(300, 600)
          .setSize(100, 35)
          .setColorForeground(color(#161759))
          .setColorActive(color(#435c27))
          .setCaptionLabel("Next");
      }
      catch(Exception e) {
      }

      try {
        theQuestion = cp5.addTextarea("theQ")
          .setPosition(300, 350)
          .setSize(300, 50)
          .setFont(createFont("arial", 18))
          .setLineHeight(14)
          .setColor(color(#4e4f4a))
          .setText(db.getString("QuestionName"))
          ;
      }
      catch(Exception e) {
      }

      try {
        RB = cp5.addRadioButton("radioButton")
          .setPosition(300, 400)
          .setSize(40, 20)
          .setColorForeground(color(#161759))
          .setColorActive(color(#435c27))
          .setColorLabel(color(#4e4f4a))
          .setItemsPerRow(2)
          .setSpacingColumn(100)
          .setSpacingRow(50)
          .addItem(db.getString("Answer1").toLowerCase(), 1)
          .addItem(db.getString("Answer2").toLowerCase(), 2)
          .addItem(db.getString("Answer3").toLowerCase(), 3)
          .addItem(db.getString("Answer4").toLowerCase(), 4)
          ;
      }
      catch(Exception e) {
      }

      //cp5.addTextfield("Answer0").setPosition(-100, -100);

      if (!db.getBoolean("IsMultipleChoice")) {
        // insert textArea to answer to

        cp5.addTextfield("Answer0")
          .setPosition(300, 450)
          .setSize(200, 40)
          .setFocus(false)
          .setColor(color(#ebebeb))
          .setColorCaptionLabel(color(#4e4f4a))
          .setCaptionLabel("Svar")
          ;
      }
    } else {
      removeQuestion();
    }
  }

  void removeQuestion() {
    try {
      cp5.getController("nextQuestion").remove();
      theQuestion.remove();
      if (db.getBoolean("IsMultipleChoice")) {
        removeRadio();
      }
    }
    catch(Exception e) {
      println("Failure removing questions: " + e);
    }

    try {
      if (!db.getBoolean("IsMultipleChoice")) { 
        cp5.getController("Answer0").remove();
      }
    }
    catch(Exception e) {
      println("Failure removing answer box: "+e);
    }
  }

  void removeRadio() {
    try {
      RB.removeItem(db.getString("Answer1").toLowerCase());
      RB.removeItem(db.getString("Answer2").toLowerCase());
      RB.removeItem(db.getString("Answer3").toLowerCase());
      RB.removeItem(db.getString("Answer4").toLowerCase());
    }
    catch(Exception e) {
      println("Failure removing radio buttons: " + e);
    }
  }
}
