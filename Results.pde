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
        .setCaptionLabel("Tilbage")
        .setPosition(width*0.1, height*0.1)
        .setSize(100, 50)
        .setBroadcast(false)
        .setValue(5)
        .setBroadcast(true)
        .setColorBackground(0xff161759)
        ;

      cp5.addButton("Logout")
        .setPosition(width*0.9, 75)
        .setSize(100, 50)
        ;

      this.headerText1 = cp5.addTextarea("ht1")
        .setPosition(width/2-50, 100)
        .setSize(200, 200)
        .setFont(createFont("arial", 40))
        .setLineHeight(12)
        .setColor(color(128))
        ;



      String query = "SELECT * FROM Questions WHERE TestId = "+ testId ;
      db.query(query);

      int questionCount = 0;
      while (db.next()) {
        questionCount++;
      }



      query = "SELECT * FROM Scores WHERE TestId = "+ testId ;
      db.query(query);


      String temp ="";
      for (; db.next(); ) {
        int tempId = db.getInt("StudentId");
        println(tempId);

        query = "SELECT * FROM Students WHERE Id = " + tempId;
        dbTwo.query(query);

        temp+= dbTwo.getString("StudentName") +" : "+ db.getInt("Score")+" af "+ questionCount+"\n";
      }

      scoreList = cp5.addTextarea("scoreList")
        .setPosition(width/2-100, 200)
        .setSize(600, 1100)
        .setFont(createFont("arial", 26))
        .setLineHeight(26)
        .setColor(color(#4e4f4a))
        ;
      scoreList.setText(temp);
    }
    catch(Exception e) {
      println(e);
    }

    cp5.addButton("Back")
      .setCaptionLabel("Tilbage")
      .setPosition(width*0.1, height*0.1)
      .setSize(50, 30)
      .setBroadcast(false)
      .setValue(5)
      .setBroadcast(true)
      .setColorBackground(0xff161759)
      ;

    this.headerText1 = cp5.addTextarea("ht1")
      .setPosition(width/2-50, 100)
      .setSize(400, 200)
      .setFont(createFont("arial", 36))
      .setLineHeight(36)
      .setColor(color(#4e4f4a))
      ;

    String query = "SELECT * FROM Tests WHERE TestId ="+ testId ;
    db.query(query);

    headerText1.setText(db.getString("TestName"));


    cp5.addButton("Logout")
      .setCaptionLabel("Log ud")
      .setPosition(width*0.9, 75)
      .setSize(100, 50)
      .setColorBackground(0xff161759)
      ;
  }
  void removeControl() {
    try {
      cp5.getController("Logout").remove();
      cp5.getController("Back").remove();
      headerText1.remove();
      scoreList.remove();
      cp5.getController("scoreList").remove();
    }
    catch(Exception e) {
      println("Failure removing all controllers for restults "+ e);
    }
  }
}
