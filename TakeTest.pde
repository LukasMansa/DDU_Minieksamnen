public class TakeTest implements Scene {

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
    cp5.addButton("Back")
      .setPosition(width*0.1, height*0.1)
      .setSize(45, 25)
      .setBroadcast(false)
      .setValue(1)
      .setBroadcast(true)
      ;

    cp5.addButton("Logout")
      //.setFont(createFont("arial", 18))
      .setPosition(width*0.9, 75)
      .setSize(75, 25)
      ;

    cp5.addButton("Afslut")
      //.setFont(createFont("arial", 18))
      .setPosition(width*0.9, 125)
      .setSize(100, 50)
      ;

    testTitle = cp5.addTextarea("txt")
      .setPosition(100, 150)
      .setSize(600, 50)
      .setFont(createFont("arial", 42))
      .setLineHeight(14)
      .setColor(color(#4e4f4a))
      ;


    //String testTest = "INSERT INTO Tests (TestName,TestId, Status) VALUES ('Matematik #1',1,0)";
    //db.query(testTest);

    //String questionTest = "INSERT INTO Questions (TestId,QuestionName, Answer1, Answer2, Answer3, Answer4, CorrectAnswer, IsMultipleChoice) "+
    //                      "values(1,'What is a seagull?', 'An animal', 'A plant', 'A fungus', 'A seahorse', 'An Animal', 0) ";

    //db.query(questionTest);

    { 
      String query = "SELECT * FROM Tests WHERE TestId='" + this.testID + "'";
      db.query(query);
      printArray(db.getTableNames());

      testTitle.setText(db.getString("TestName"));


      query = "SELECT * FROM Questions WHERE TestId='" + this.testID + "'";
      db.query(query);

      //println(db.getString("QuestionName"));

      //while(db.next()){
      //println(db.getString("QuestionName"));
      //}


      cp5.addTextarea("theQ")
        .setPosition(300, 350)
        .setSize(300, 50)
        .setFont(createFont("arial", 18))
        .setLineHeight(14)
        .setColor(color(#4e4f4a))
        .setText(db.getString("QuestionName"))
        ;

      cp5.addRadioButton("radioButton")
        .setPosition(300, 400)
        .setSize(40, 20)
        .setColorForeground(color(#161759))
        .setColorActive(color(#435c27))
        .setColorLabel(color(#4e4f4a))
        .setItemsPerRow(2)
        .setSpacingColumn(100)
        .setSpacingRow(50)
        .addItem(db.getString("Answer1"), 1)
        .addItem(db.getString("Answer2"), 2)
        .addItem(db.getString("Answer3"), 3)
        .addItem(db.getString("Answer4"), 4)
        ;

      cp5.addButton("nextQuestion")
        .setPosition(300, 600)
        .setSize(100, 35)
        .setColorForeground(color(#161759))
        .setColorActive(color(#435c27))
        .setCaptionLabel("Aflever og gå til næste");
        ;
      ;
    }
  }

  void removeControl() {
    try {
      cp5.getController("Logout").remove();
      cp5.getController("Back").remove();
      cp5.getController("Afslut").remove();
      cp5.getController("radioButton").remove();
      cp5.getController("theQ").remove();
      testTitle.remove();
    }
    catch(Exception e) {
    }
  }
}

public void Afslut() {
  println("Student test terminated");
}

public void Back(int theValue) {
  changeScene(currentScene, theValue);
}

public void nextQuestion(){
  println("hi");
  db.next();
  println("hi once again");
}
