ArrayList<Button> tests = new ArrayList<Button>(); //<>//
ArrayList<Textarea> testNames = new ArrayList<Textarea>();
ArrayList<Button> checkAnswers = new ArrayList<Button>();
public class TeacherMainPage implements Scene {
  Textarea yourTests;

  TeacherMainPage() {
  }
  void inizializeControl() {
    // rendes the header of the page
    cp5.addButton("NewTest")
      .setCaptionLabel("Ny Test")
      .setPosition(width*0.1, height*0.7)
      .setSize(100, 50)
       .setColorBackground(0xff161759)
      //.setColorBackground(color(255, 100))
      //.setColorForeground(color(255, 100));
      ;

    cp5.addButton("Import")
      .setCaptionLabel("Importer nyt hold")
      .setPosition(width*0.2, height*0.7)
      .setSize(150, 50)
      ;
    // logout button
    cp5.addButton("Logout")
      .setCaptionLabel("Log ud")
      //.setFont(createFont("arial", 18))
      .setPosition(width*0.9, 75)
      .setSize(100, 50)
       .setColorBackground(0xff161759)
      ;

    String query = "SELECT * FROM Tests WHERE TeacherId = " + personID;
    db.query(query);
    for (int i = 0; db.next(); i++) {
      if (db.getInt("Status") == 0) {
        tests.add(cp5.addButton("TestStatus"+i)
          .setPosition(150+300*i, 250)
          .setSize(100, 50)
          .setBroadcast(false)
          .setValue(db.getInt("Status"))
          .setBroadcast(true)
          .setCaptionLabel("Start Test")
          );
      } else if (db.getInt("Status") == 1) {
        tests.add(cp5.addButton("TestStatus"+i)
          .setPosition(150+300*i, 250)
          .setSize(100, 50)
          .setBroadcast(false)
          .setValue(db.getInt("Status"))
          .setBroadcast(true)
          .setCaptionLabel("Afslut")
          );

      } else if (db.getInt("Status") == 2) {
        tests.add(cp5.addButton("TestStatus"+i)
          .setPosition(150+300*i, 250)
          .setSize(100, 50)
          .setBroadcast(false)
          .setValue(db.getInt("Status"))
          .setBroadcast(true)
          .setCaptionLabel("Fjern test")
          );
        checkAnswers.add(cp5.addButton("CheckAnswer" + checkAnswers.size())
          .setPosition(260+300*i, 250)
          .setSize(140, 50)
          .setBroadcast(false)
          .setValue(db.getInt("TestId"))
          .setBroadcast(true)
          .setCaptionLabel("Vis besvarelser")
          );
      }
      if (db.getInt("Status")<3) {
        testNames.add(cp5.addTextarea("TestName"+i)
          .setPosition(150+300*i, 200)
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

    yourTests = cp5.addTextarea("txt")
      .setPosition(100, 100)
      .setSize(300, 100)
      .setFont(createFont("arial", 42))
      .setLineHeight(14)
      .setColor(color(#4e4f4a))
      //.setColorBackground(color(255, 100))
      //.setColorForeground(color(255, 100));
      ;
    yourTests.setText("Dine Tests");
  }

  void removeControl() {
    try {
      cp5.getController("NewTest").remove();
      cp5.getController("Logout").remove();
      cp5.getController("Import").remove();
      
      for (int i = 0; i<tests.size(); i++) {
        cp5.getController("TestStatus"+i).remove();
      }
      
      for (int i = 0; i<checkAnswers.size(); i++) {
        cp5.getController("CheckAnswer"+i).remove();
      }

      for (int i = 0; i<testNames.size(); i++) {
        testNames.get(i).remove();
      }
      tests.clear();
      testNames.clear();
      yourTests.remove();
      checkAnswers.clear();
    } 
    catch(Exception e) {
      println(e);
    }
  }
}
