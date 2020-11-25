class Import implements Scene {
  Textarea importText;
  void inizializeControl() {
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
    cp5.addButton("Importer")
      .setCaptionLabel("Vælg hold")
      .setPosition(width*0.5-50, height*0.9)
      .setSize(100, 25)
      ;

    importText = cp5.addTextarea("ImportText")
      .setPosition(width*0.5-125, height*0.1)
      .setSize(350, 250)
      .setLineHeight(14)
      .setColor(color(#4e4f4a))
      ;
    importText.setText("For at importere et hold, skal holdet være i en excel-fil (.xslx). Holdet skal være formateret præcis som Lectio formaterer, når du eksporterer et hold derfra");
  }

  void removeControl() {
    try {
      cp5.getController("Importer").remove();
      cp5.getController("Back").remove();
      cp5.getController("Logout").remove();
      importText.remove();
    } 
    catch(Exception e) {
    }
  }
}

public void Importer() {
  selectInput("Select a file to process:", "fileSelected");
}

void fileSelected(File selection) {
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
    if(newPath.contains(".xslx")) {
    saving = importExcel(newPath);
    } else {
      println("File selected is not an excel file");
    }
    for (String s[] : saving) {
      if (s[1] != null) {
        s[1] = s[1].replaceAll("\\s+", "");
        if (s[1].length()>3 && !s[1].contains("Fornavn")) {
          username = s[1].substring(0, 4).toLowerCase() + String.format("%04d", (int) random(0, 9999));
        }
      }
      if (s[0] != null) {
        if (!s[0].contains("Klassen") && !s[0].contains("Antal") && s[0].length()>3) {
          _class = s[0].substring(2, s[0].length()-3);
        }
      }
      String query = "INSERT INTO Students (StudentName, Password, Class, IsTeacher) VALUES (" + db.escape(username) + ", '" +encrypt.encrypt(password)+ "', " + db.escape(_class) + ", '0')";
      db.query(query);
    }
  }
}
