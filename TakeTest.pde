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
      try {
        inizializeQuestion();
      }
      catch(Exception e) {
      }
    }
  }

  void removeControl() {
    try {
      cp5.getController("Logout").remove();
      cp5.getController("Back").remove(); 
      cp5.getController("Afslut").remove(); 
      removeRadio(); 
      theQuestion.remove();
      testTitle.remove();
      cp5.getController("nextQuestion").remove();
    }
    catch(Exception e) {
      println("Failure removing all controllers: " + e);
    }
  }

  void inizializeQuestion() {
    //db.next();
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
    } else {

      removeQuestion();
    }
  }

  void removeQuestion() {
    try {
      cp5.getController("nextQuestion").remove();
      removeRadio();
      theQuestion.remove();
    }
    catch(Exception e) {
      println("Failure removing questions: " + e);
    }
  }

  void removeRadio() {
    
    RB.removeItem(db.getString("Answer1").toLowerCase());
    RB.removeItem(db.getString("Answer2").toLowerCase());
    RB.removeItem(db.getString("Answer3").toLowerCase());
    RB.removeItem(db.getString("Answer4").toLowerCase());
    println("Remove Radio");
  }
}

public void Afslut() {
   TakeTest TT = (TakeTest) scenes[2];
  String Quary = "INSERT INTO Scores (TestId, StudentId, Score) VALUES (" +TT.testID+ ", " + personID +", " + studentScore +")";
  db.query(Quary);
  
  println("Student test terminated");
  changeScene(currentScene, 0);
}

public void Back(int theValue) {
  changeScene(currentScene, theValue);
}

int studentScore;

public void nextQuestion() {
  TakeTest TT = (TakeTest) scenes[2]; // refactor this to refrer to the correct test
  // get the students answer
  // get the true answer with SQL
  // compare the two
  // add zero or one to the int;
  println(TT.RB.getState(db.getString("CorrectAnswer").toLowerCase()));

  if (TT.RB.getState(db.getString("CorrectAnswer").toLowerCase())) {
    studentScore++;
  }
  // once the test is done, send the score via SQL to Scores table

  try {
    TT.removeQuestion();
    TT.inizializeQuestion();
  }
  catch(Exception e) {
    println("Failure: " + e);
  }
}
