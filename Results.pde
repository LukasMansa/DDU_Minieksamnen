//Her skal læren komme hen når læren trykker på se besvarelser inde i StudentMainPage.
//Læren skal kun komme herind når læren har afsluttet testen.
class Results implements Scene {
  Textarea headerText1;
  Textarea scoreList;

  int testId;

  Results(int _testId) {
    this.testId = _testId;
  }


  void inizializeControl() {
    try {

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

      this.headerText1 = cp5.addTextarea("ht1")
        .setPosition(width/2-50, 100)
        .setSize(200, 200)
        .setFont(createFont("arial", 40))
        .setLineHeight(12)
        .setColor(color(128))
        ;

      String query = "SELECT * FROM Tests WHERE TestId ="+ testId ;
      db.query(query);

      headerText1.setText(db.getString("TestName"));

      query = "SELECT * FROM Scores WHERE TestId = "+ testId ;
      db.query(query);


      String temp ="";
      for (int i = 0; db.next(); i++) {
        int tempId = db.getInt("StudentId");
        
        query = "SELECT * FROM Stundets WHERE Id = " + tempId;
        dbTwo.query(query);

        temp+= dbTwo.getString("StudentName") + db.getInt("Score")+"\n";
      }
      println(temp + "temp");

      scoreList = cp5.addTextarea("scoreList")
        .setPosition(width/2-50, 350)
        .setSize(200, 600)
        .setFont(createFont("arial", 40))
        .setLineHeight(40)
        .setColor(color(#4e4f4a))
        ;
      scoreList.setText(temp);
    }
    catch(Exception e) {
      println(e);
    }
  }
  void removeControl() {
    try {
      cp5.getController("Logout").remove();
      cp5.getController("Back").remove();
      headerText1.remove();
      scoreList.remove();
      println("here");
      cp5.getController("scoreList").remove();
      //cp5.getController("").remove();
      //cp5.getController("ht1").remove();
    }
    catch(Exception e) {
      println("Failure removing all controllers for restults "+ e);
    }
  }
}
