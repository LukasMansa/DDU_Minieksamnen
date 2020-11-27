void controlEvent(ControlEvent theEvent) { //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
  if (theEvent.isFrom(MultipleChoiceButton)) { 
    if (MultipleChoiceButton.getState(0)==true) {
      cp5.getController("Svar").remove();
      cp5.addTextfield("Svar1")
        .setPosition(width/2-200, 400)
        .setSize(200, 40)
        .setColor(color(#ebebeb))
        .setColorCaptionLabel(color(#4e4f4a))
        ;
      cp5.addTextfield("Svar2")
        .setPosition(width/2+20, 400)
        .setSize(200, 40)
        .setColor(color(#ebebeb))
        .setColorCaptionLabel(color(#4e4f4a))
        ;
      cp5.addTextfield("Svar3")
        .setPosition(width/2-200, 475)
        .setSize(200, 40)
        .setColor(color(#ebebeb))
        .setColorCaptionLabel(color(#4e4f4a))
        ;
      cp5.addTextfield("Svar4")
        .setPosition(width/2+20, 475)
        .setSize(200, 40)
        .setColor(color(#ebebeb))
        .setColorCaptionLabel(color(#4e4f4a))
        ;
      this.headerText2 = cp5.addTextarea("Instructions")
        .setPosition(width/2-100, 325)
        .setSize(200, 60)
        .setFont(createFont("arial", 16))
        .setLineHeight(14)
        .setColor(color(128))
        ;
      headerText2.setText("Vælg det rigtige svar ved at trykke på boksen ved siden af muligheden");
      if (CorrectAnswer == null) {
        CorrectAnswer = cp5.addRadioButton("CorrectAnswer")
          .setPosition(width/2-230, 410)
          .setSize(20, 20)
          .setColorForeground(color(#161759))
          .setColorActive(color(#435c27))
          .setColorLabel(color(#ebebeb))
          .setItemsPerRow(2)
          .setSpacingColumn(440)
          .setSpacingRow(55)
          .addItem("0", 0)
          .addItem("1", 1)
          .addItem("2", 2)
          .addItem("3", 3)
          ;
      } else {
        CorrectAnswer.addItem("0", 0);
        CorrectAnswer.addItem("1", 1);
        CorrectAnswer.addItem("2", 2);
        CorrectAnswer.addItem("3", 3);
      }
    } else {
      cp5.getController("Svar1").remove();
      cp5.getController("Svar2").remove();
      cp5.getController("Svar3").remove();
      cp5.getController("Svar4").remove(); 
      headerText2.remove();
      CorrectAnswer.removeItem("0");
      CorrectAnswer.removeItem("1");
      CorrectAnswer.removeItem("2");
      CorrectAnswer.removeItem("3");

      cp5.addTextfield("Svar")
        .setPosition(width/2 - 100, 400)
        .setSize(200, 40)
        .setColor(color(#ebebeb))
        .setColorCaptionLabel(color(#4e4f4a))
        ;
    }
    if (MultipleChoiceButton.getState(0)== false) {
      isMultipleChoice = 0;
    } else {
      isMultipleChoice = 1;
    }
  }
  if (currentScene == 5) {
    if (theEvent.getName() != "Login") {
      String query = "SELECT * FROM Tests";
      db.query(query);
      for (int i = 0; db.next(); i++) {
        if (db.getInt("Status")<3) {
          if (tests.size()>0) {
            if (theEvent.isFrom(tests.get(i))) {
              tests.get(i).setBroadcast(false);
              tests.get(i).setValue(tests.get(i).getValue()+1);
              tests.get(i).setBroadcast(true);
              query = "UPDATE Tests SET Status = " + tests.get(i).getValue() + " WHERE TestId = " + db.getInt("TestId");
              db.query(query);
              scenes[5].removeControl();
              scenes[5].inizializeControl();
              //query = "SELECT * FROM Tests";
              //db.query(query);
              //for (int j = 0; db.next(); j++) {
              //  if (db.getInt("Status") == 1) {
              //    tests.get(i).setCaptionLabel("Afslut test");

              //    admin.add(cp5.addButton("Administrate"+i)
              //      .setPosition(310+250*i, 250)
              //      .setSize(50, 50)
              //      .setBroadcast(false)
              //      .setValue(1)
              //      .setBroadcast(true)
              //      );
              //  }
              //}
            }
          }
          if (studentTests.size()>0) {
            if (theEvent.isFrom(studentTests.get(i))) {
            }
          }
        } else {
          i--;
        }
      }
    }
  }
  if (currentScene==1) {
    for (int i = 0; i<studentTests.size(); i++) {
      if (theEvent.isFrom(studentTests.get(i))) {
        int testId = (int) studentTests.get(i).getValue();
        scenes[2] = new TakeTest(testId);
        changeScene(currentScene, 2);
      }
    }
  }
  for (int i = 0; i<classes.size(); i++) {
    if (theEvent.isFrom("class"+classes.get(i))) {
      selectedTeam = classes.get(i);
      if (queries.size() == 0) {
        queries.add("INSERT INTO Tests (TestName, Status, Class, TeacherId) VALUES (" + db.escape(testName) + ", 0, " + db.escape(selectedTeam) + ", " + personID + ")");
      } else {
        queries.removeFirst();
        queries.addFirst("INSERT INTO Tests (TestName, Status, Class, TeacherId) VALUES (" + db.escape(testName) + ", 0, " + db.escape(selectedTeam) + ", " + personID + ")");
      }
      changeScene(currentScene, 4);
    }
  }
}

public void Create() {
  String questionName = cp5.get(Textfield.class, "Spørgsmål:").getText();
  String correctAnswer = "";
  String query = "SELECT * FROM Tests";
  int testId = 1;
  db.query(query);
  while (db.next()) {
    testId++;
  }
  if (isMultipleChoice == 1) {
    String answer1 = cp5.get(Textfield.class, "Svar1").getText();
    String answer2 = cp5.get(Textfield.class, "Svar2").getText();
    String answer3 = cp5.get(Textfield.class, "Svar3").getText();
    String answer4 = cp5.get(Textfield.class, "Svar4").getText();

    for (int i = 0; i<4; i++) {
      if (CorrectAnswer.getState(i) == true) {
        correctAnswer = cp5.get(Textfield.class, "Svar"+(i+1)).getText();
      }
    }
    queries.add("INSERT INTO Questions (QuestionName, Answer1, Answer2, Answer3, Answer4, CorrectAnswer, IsMultipleChoice, TestId) VALUES (" + db.escape(questionName) +  ", " + db.escape(answer1) + ", " + db.escape(answer2) + ", " + db.escape(answer3) + ", " + db.escape(answer4) + ", " + db.escape(correctAnswer) + ", " + isMultipleChoice + ", " + testId + ")");
    changeScene(currentScene, 4);
  } else {
    correctAnswer = cp5.get(Textfield.class, "Svar").getText();
    queries.add("INSERT INTO Questions (QuestionName, CorrectAnswer, IsMultipleCHoice, TestId) VALUES (" + db.escape(questionName) + ", " + db.escape(correctAnswer) + ", " + isMultipleChoice + ", " + testId + ")");
    changeScene(currentScene, 4);
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
  if (selectedTeam.length()>0 && testName.length()>0 && selectedTeam != "") {
    for (String q : queries) {
      db.query(q);
    }
    testName = "";
    selectedTeam = "";
    queries.clear();
    changeScene(currentScene, 5);
  } else {
    errorMessage.setText("Fejl: Intet hold er valgt");
  }
}
public void Importer() {
  selectInput("Select a file to process:", "fileSelected");
}

public void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    String newPath = new String();
    String backslash = "\\";
    for (int i = 0; i<selection.getAbsolutePath().length(); i++) {
      newPath += selection.getAbsolutePath().charAt(i);
      if (selection.getAbsolutePath().charAt(i) == '\\') {
        newPath += backslash;
      }
    }
    String[][] saving = null;
    String username = null;
    String password = "a";
    String _class = null;
    if (newPath.contains(".xlsx")) {
      saving = importExcel(newPath);
      for (String s[] : saving) {
        if (s[1] != null) {
          s[1] = s[1].replaceAll("\\s+", "");
          if (s[1].length()>3 && !s[1].contains("Fornavn")) {
            username = s[1].substring(0, 4).toLowerCase() + String.format("%04d", (int) random(0, 9999));
          }
        }
        if (s[0] != null) {
          if (!s[0].contains("Klassen") && !s[0].contains("Antal") && s[0].length()>3) {
            _class = s[0].substring(2, s[0].length()-3); //<>// //<>//
          }
        }
        //<>// //<>//
        if (username != null && _class != null) {
          String query = "INSERT INTO Students (StudentName, Password, Class, IsTeacher) VALUES (" + db.escape(username) + ", '" +encrypt.encrypt(password)+ "', " + db.escape(_class) + ", '0')";
          db.query(query);
          error.setText("");
        }
      }
    } else {
      error.setText("Error: File selected is not an excel file");
    }
  }
}

public void Login() {
  if (frameCount>0) {
    String name = cp5.get(Textfield.class, "Username").getText();
    String password = cp5.get(Textfield.class, "Password").getText();
    password = encrypt.encrypt(password);
    String query = "SELECT * FROM Students WHERE StudentName=" + db.escape(name) + " AND Password=" + db.escape(password);
    db.query(query);
    if (db.next()) {
      println("Login Successful");
      personID = db.getInt(1);
      if (!db.getBoolean("isTeacher")) {
        changeScene(0, 1);
      } else {
        changeScene(0, 5);
      }
    }
  }
}

public void Logout() {
  changeScene(currentScene, 0);
}

public void Afslut() {


  TakeTest TT = (TakeTest) scenes[2];
  String query = "INSERT INTO Scores (TestId, StudentId, Score) VALUES (" +TT.testID+ ", " + personID +", " + studentScore +")";
  db.query(query);
  changeScene(currentScene, 1);
}

public void Back(int theValue) {
  changeScene(currentScene, theValue);
}

int studentScore;

public void nextQuestion() {
  TakeTest TT = (TakeTest) scenes[2]; // refactor this to refrer to the correct test
  // get the students answer, get the true answer with SQL, compare the two, add zero or one to the int;
  if (db.getBoolean("IsMultipleChoice")) {
    if (TT.RB.getState(db.getString("CorrectAnswer").toLowerCase())) {
      studentScore++;
    }
  }

  if (!db.getBoolean("IsMultipleChoice")) {
    String trueAnswer = db.getString("CorrectAnswer").toLowerCase();
    String studAnswer = "";
    studAnswer = cp5.get(Textfield.class, "Answer0").getText();

    //println(trueAnswer, studAnswer );
    //println(trueAnswer, studAnswer);
    if (trueAnswer.equals(studAnswer)) {
      //println("was true");
      studentScore++;
    }
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

public void NewTest() {
  changeScene(currentScene, 4);
}

public void Import() {
  changeScene(currentScene, 9);
}
