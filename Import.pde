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
    for(int i = 0; i<selection.getAbsolutePath().length(); i++) {
      newPath += selection.getAbsolutePath().charAt(i);
      if(selection.getAbsolutePath().charAt(i) == '\\') {
        newPath += backslash;
      }
    }
    String[][] saving;
    saving = importExcel(newPath);
       for(String s[] : saving) {
     println(s[1]); 
    }
  }
}
