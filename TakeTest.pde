public class TakeTest implements Scene {

  int testID;
  Textarea testTitle;

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


    String testTest = "INSERT INTO Tests (TestName,TestId, Status) VALUES ('Matematik #1',1,0)";
    db.query(testTest);

    { 
      String query = "SELECT * FROM Tests WHERE TestId='" + this.testID + "'";
      db.query(query);




      printArray(db.getTableNames());

      //testTitle.setText(db.getString("TestName"));
    }
  }

  void removeControl() {
    try {
      cp5.getController("Logout").remove();
      cp5.getController("Back").remove();
      cp5.getController("Afslut").remove();
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
