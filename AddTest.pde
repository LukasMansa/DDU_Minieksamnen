String testName = "";
Textarea errorMessage;
LinkedList<String> queries = new LinkedList<String>();
class AddTest implements Scene {
  Textarea headerText2;
  Textarea headerText3;

  void inizializeControl() {
    cp5.addButton("Back")
      .setCaptionLabel("Tilbage")
      .setPosition(width*0.1, height*0.1)
      .setSize(50, 30)
      .setBroadcast(false)
      .setValue(5)
      .setBroadcast(true)
      .setColorBackground(0xff161759)
      ;

    cp5.addButton("Logout")
      .setCaptionLabel("Log ud")
      .setPosition(width*0.9, 75)
      .setSize(100, 50)
      .setColorBackground(0xff161759)
      ;

    cp5.addTextfield("Test navn")
      .setText(testName)
      .setPosition(width/2 - 100, 100)
      .setSize(200, 40)
      .setFocus(true)
      .setColor(color(#ebebeb))
      .setColorCaptionLabel(color(#4e4f4a))
      ;

    cp5.addButton("Hold")  //Her skal man kunne vælge klasser som man underviser i.
      .setCaptionLabel("Vælg Hold")
      .setPosition(width/2, 300) //Vis bogstav æ i vÆlg hold.
      .setSize(100, 50)
      .setColorBackground(0xff161759)
      ;

    cp5.addButton("Opret")  //Her skal man kunne vælge klasser som man underviser i.
      .setPosition(width/2, 400) //Vis bogstav æ i vÆlg hold.
      .setSize(100, 50)
      .setColorBackground(0xff161759)
      ;

    cp5.addButton("MakeTest")
      .setPosition(width/2-75/2, height-150)
      .setSize(100, 50)
      .setCaptionLabel("Lav Test")
      .setColorBackground(0xff161759)
      ;

    cp5.addButton("Gem")
      .setCaptionLabel("Gem test navn")
      .setPosition(width/2-150, 300)
      .setSize(100, 50)
      .setFont(createFont("arial", 9))
      .setColorBackground(0xff161759)
      ;

    if (errorMessage == null) {
      errorMessage = cp5.addTextarea("ErrorMessage")
        .setColor(color(#FF3636))
        .setPosition(width/2-25, 50)
        .setSize(200, 30)
        ;
      errorMessage.setText("");
    }
    this.headerText2 = cp5.addTextarea("ht2")
      .setPosition(width/2, 250)
      .setSize(150, 50)
      .setFont(createFont("arial", 12))
      .setLineHeight(12)
      .setColor(color(128))
      ;
    headerText2.setText("Hold: " + selectedTeam);
    this.headerText3 = cp5.addTextarea("ht3")
      .setPosition(width/2, 350)
      .setSize(100, 50)
      .setFont(createFont("arial", 12))
      .setLineHeight(12)
      .setColor(color(128))
      ;
    headerText3.setText("Opret spørgsmål");
  }
  void removeControl() {
    try {
      cp5.getController("Logout").remove();
      cp5.getController("Test navn").remove();
      cp5.getController("Hold").remove();
      cp5.getController("Back").remove();
      cp5.getController("Opret").remove();
      cp5.getController("Gem").remove();
      cp5.getController("MakeTest").remove();
      headerText2.remove();
      headerText3.remove();
      errorMessage.setText("");
      cp5.getController("ErrorMessage").remove();
    }
    catch(Exception e) {
    }
  }
}
public void Opret() {
  if (testName.length()>0) {
    changeScene(currentScene, 3);
  } else {
    errorMessage.setText("Fejl: Navngiv din test først tak");
  }
}

public void Hold() {
  changeScene(currentScene, 6);
}

public void Gem() {
  testName = cp5.get(Textfield.class, "Test navn").getText();
  if (testName.length()>0) {
    errorMessage.setText("");
    if (queries.size() == 0) {
      queries.add("INSERT INTO Tests (TestName, Status, Class, TeacherId) VALUES (" + db.escape(testName) + ", 0, " + db.escape(selectedTeam) + ", " + personID + ")");
    } else {
      queries.removeFirst();
      queries.addFirst("INSERT INTO Tests (TestName, Status, Class, TeacherId) VALUES (" + db.escape(testName) + ", 0, " + db.escape(selectedTeam) + ", " + personID + ")");
    }
  } else {
    errorMessage.setText("Fejl: Test har intet navn");
  }
}

public void MakeTest() {
  if (selectedTeam.length()>0 && testName.length()>0) {
    for (String q : queries) {
      db.query(q);
    }
    testName = "";
    changeScene(currentScene, 5);
  }
}
