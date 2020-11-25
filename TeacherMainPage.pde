ArrayList<Button> tests = new ArrayList<Button>(); //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
ArrayList<Textarea> testNames = new ArrayList<Textarea>();
ArrayList<Button> admin = new ArrayList<Button>();
ArrayList<Button> checkAnswers = new ArrayList<Button>();
public class TeacherMainPage implements Scene {
  Textarea yourTests;


  TeacherMainPage() {
  }
  void inizializeControl() {
    // rendes the header of the page
    cp5.addButton("NewTest")
      .setCaptionLabel("Ny Test")
      .setPosition(width*0.1, height*0.4)
      .setSize(100, 50)
       .setColorBackground(0xff161759)
      //.setColorBackground(color(255, 100))
      //.setColorForeground(color(255, 100));
      ;

    // logout button
    cp5.addButton("Logout")
      .setCaptionLabel("Log ud")
      //.setFont(createFont("arial", 18))
      .setPosition(width*0.9, 75)
      .setSize(100, 50)
       .setColorBackground(0xff161759)
      ;

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

    String query = "SELECT * FROM Tests WHERE TeacherId = " + personID;
    db.query(query);
    for (int i = 0; db.next(); i++) {
      if (db.getInt("Status") == 0) {
        tests.add(cp5.addButton("TestStatus"+i)
          .setPosition(250+250*i, 250)
          .setSize(100, 50)
          .setBroadcast(false)
          .setValue(db.getInt("Status"))
          .setBroadcast(true)
          .setCaptionLabel("Start Test")
          );
      } else if (db.getInt("Status") == 1) {
        tests.add(cp5.addButton("TestStatus"+i)
          .setPosition(250+250*i, 250)
          .setSize(100, 50)
          .setBroadcast(false)
          .setValue(db.getInt("Status"))
          .setBroadcast(true)
          .setCaptionLabel("Afslut")
          );
        admin.add(cp5.addButton("Administrate"+admin.size())
          .setPosition(310+250*i, 250)
          .setSize(100, 50)
          .setBroadcast(false)
          .setValue(1)
          .setBroadcast(true)
          );
      } else if (db.getInt("Status") == 2) {
        tests.add(cp5.addButton("TestStatus"+i)
          .setPosition(250+250*i, 250)
          .setSize(50, 25)
          .setBroadcast(false)
          .setValue(db.getInt("Status"))
          .setBroadcast(true)
          .setCaptionLabel("Fjern test")
          );
        checkAnswers.add(cp5.addButton("CheckAnswer"+checkAnswers.size())
          .setPosition(310+250*i, 250)
          .setSize(75, 25)
          .setBroadcast(false)
          .setValue(2)
          .setBroadcast(true)
          );
      }
      if (db.getInt("Status")<3) {
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
      cp5.getController("NewTest").remove();
      cp5.getController("Logout").remove();

      for (int i = 0; i<tests.size(); i++) {
        cp5.getController("TestStatus"+i).remove();
      }
      for (int i = 0; i<admin.size(); i++) {
        cp5.getController("Administrate"+i).remove();
      }
      for (int i = 0; i<testNames.size(); i++) {
        testNames.get(i).remove();
      }
      for (int i = 0; i<checkAnswers.size(); i++) {
        cp5.getController("CheckAnswer"+i).remove();
      }
      tests.clear();
      testNames.clear();
      yourTests.remove();
      admin.clear();
      checkAnswers.clear();
    } 
    catch(Exception e) {
      println(e);
    }
  }
}

public void NewTest() {
  changeScene(currentScene, 4);
}
