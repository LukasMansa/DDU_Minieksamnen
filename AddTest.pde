String testName = ""; //<>// //<>// //<>//
Textarea errorMessage;
LinkedList<String> queries = new LinkedList<String>();
class AddTest implements Scene {
  Textarea headerText2;
  Textarea headerText3;

  void inizializeControl() {
    cp5.addButton("Back")
      .setCaptionLabel("Tilbage")
      .setFont(createFont("arial", 10))
      .setPosition(width*0.1, height*0.1)
      .setSize(75, 25)
      .setBroadcast(false)
      .setValue(3)
      .setBroadcast(true)
      ;

    cp5.addButton("Logout")
      .setCaptionLabel("Log ud")
      .setFont(createFont("arial", 10))
      .setPosition(width*0.9, 75)
      .setSize(75, 25)
      ;
    cp5.addTextfield("TestName")
      .setCaptionLabel("Test navn")
      .setFont(createFont("arial", 10))
      ;
    cp5.addTextfield("Test navn")
      .setText(testName)
      .setPosition(width/2 - 100, 100)
      .setSize(200, 40)
      .setFocus(true)
      .setColor(color(#ebebeb))
      .setColorCaptionLabel(color(#4e4f4a))
      ;

    cp5.addButton("ChooseTeam")  //Her skal man kunne vælge klasser som man underviser i.
      .setCaptionLabel("Vælg hold")
      .setFont(createFont("arial", 10))
      ;
    cp5.addButton("Hold")  //Her skal man kunne vælge klasser som man underviser i.
      .setCaptionLabel("Vælg Hold")
      .setPosition(width/2, 300) //Vis bogstav æ i vÆlg hold.
      .setSize(75, 25)
      ;

    this.headerText2 = cp5.addTextarea("ht2")
      .setPosition(width/2, 250)
      .setSize(100, 50)
      .setFont(createFont("arial", 12))
      .setLineHeight(12)
      .setColor(color(128))
      ;
    headerText2.setText("Hold: " + selectedTeam);

    cp5.addButton("Add")  //Her skal man kunne vælge klasser som man underviser i.
      .setCaptionLabel("Opret")
      .setFont(createFont("arial", 10))
      .setPosition(width/2, 400) //Vis bogstav æ i vÆlg hold.
      .setSize(75, 25)
      ;

    cp5.addButton("MakeTest")
      .setPosition(width/2-75/2, height-150)
      .setSize(75, 25)
      .setCaptionLabel("Lav Test")
      ;

    this.headerText3 = cp5.addTextarea("ht3")
      .setPosition(width/2, 350)
      .setSize(100, 50)
      .setFont(createFont("arial", 12))
      .setLineHeight(12)
      .setColor(color(128))
      ;
    headerText3.setText("Opret spørgsmål");

    cp5.addButton("Save")
      .setCaptionLabel("Gem")
      .setFont(createFont("arial", 10))
      ;
    cp5.addButton("Gem")
      .setCaptionLabel("Gem test navn")
      .setPosition(width/2-100, 300)
      .setSize(75, 25)
      ;
    if (errorMessage == null) {
      errorMessage = cp5.addTextarea("ErrorMessage")
        .setColor(color(255, 0, 0))
        .setPosition(width/2-25, 50)
        .setSize(100, 20)
        ;
      errorMessage.setText("");
    }
  }
  void removeControl() {
    try {
      cp5.getController("Logout").remove();
      cp5.getController("TestName").remove();
      cp5.getController("ChooseTeam").remove();
      cp5.getController("Back").remove();
      cp5.getController("Add").remove();
      cp5.getController("Save").remove();
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
  changeScene(currentScene, 3);
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
      queries.add("INSERT INTO Tests (TestName, Status, Class) VALUES (" + db.escape(testName) + ", 0, " + db.escape(selectedTeam) + ")");
    } else {
      queries.removeFirst();
      queries.addFirst("INSERT INTO Tests (TestName, Status, Class) VALUES (" + db.escape(testName) + ", 0, " + db.escape(selectedTeam) + ")");
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
  }
}
