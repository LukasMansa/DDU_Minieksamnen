ArrayList<Button> studentTests = new ArrayList<Button>();
public class StudentMainPage implements Scene {
  Textarea yourTest;

  void inizializeControl() {
    // rendes the header of the page
    yourTest = cp5.addTextarea("txt")
      .setPosition(100, 100)
      .setSize(200, 50)
      .setFont(createFont("arial", 42))
      .setLineHeight(14)
      .setColor(color(#4e4f4a))
      //.setColorBackground(color(255, 100))
      //.setColorForeground(color(255, 100));
      ;
    yourTest.setText("Dine Test");

    // Logout button
    cp5.addButton("Logout")
      //.setFont(createFont("arial", 18))
      .setBroadcast(false)
      .setPosition(width*0.9, 75)
      .setSize(75, 25)
      .setBroadcast(true)
      ;   
    String query = "SELECT * FROM Students WHERE Id = " + personID;
    db.query(query);
    db.next();
    String studentClass = db.getString("Class");
    ArrayList<Integer> testIds = new ArrayList<Integer>();
    int nonIdenticalTests = 0;
    query = "SELECT * FROM Scores WHERE StudentId = '" + personID + "'";
    db.query(query);
    while(db.next()) {
      testIds.add(db.getInt("TestId"));
    }
    query = "SELECT * FROM Tests WHERE Class = '" + studentClass + "'";
    db.query(query);
    for (int i = 0; db.next(); i++) {
      for(int t : testIds) {
        if(t!=db.getInt("TestId")) {
          nonIdenticalTests++;
        }
      }
      if (db.getInt("Status") == 1 && nonIdenticalTests==testIds.size()) {
        studentTests.add(cp5.addButton("Test"+i)
          .setBroadcast(false)
          .setPosition(250+250*i, 250)
          .setSize(50, 25)
          .setValue(db.getInt("TestId"))
          .setCaptionLabel("Tag test")
          .setBroadcast(true)
          );
                  testNames.add(cp5.addTextarea("TestName"+i)
          .setPosition(250+250*i, 200)
          .setSize(100, 50)
          .setFont(createFont("arial", 20))
          .setLineHeight(14)
          .setColor(color(#4e4f4a))
          );
        testNames.get(i).setText(db.getString(2));
      } else {
        i--;
      }
    }
  }

  void removeControl() {
    try {
      yourTest.remove();
      cp5.getController("Logout").remove();
      for (int i = 0; i<studentTests.size(); i++) {
        cp5.getController("Test"+i).remove();
      }
      for (int i = 0; i<testNames.size(); i++) {
          testNames.get(i).remove();
      }
      studentTests.clear();
      testNames.clear();
    }
    catch(Exception e) {
    }
  }
}

public void Logout() {
  changeScene(currentScene, 0);
}
