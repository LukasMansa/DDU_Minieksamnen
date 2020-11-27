Textarea error;  //<>//
class Import implements Scene {
  Textarea importText;

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
      
    cp5.addButton("Importer")
      .setCaptionLabel("Vælg hold")
      .setPosition(width*0.5-50, height*0.9)
      .setSize(100, 50)
      ;

    importText = cp5.addTextarea("ImportText")
      .setPosition(width*0.5-250, height*0.1)
      .setSize(500, 250)
      .setLineHeight(14)
      .setFont(createFont("arial", 24))
      .setColor(color(#4e4f4a))
      ;
    importText.setText("For at importere et hold, skal holdet være i en excel-fil (.xslx). Holdet skal være formateret præcis som Lectio formaterer, når du eksporterer et hold derfra. Holdet skal exporteres fra Lectio uden billeder, altså almindelig visning.");

    if (error == null) {
      error = cp5.addTextarea("Error")
        .setColor(color(#FF3636))
        .setPosition(width/2-25, 50)
        .setSize(200, 30)
        ;
      error.setText("");
    }
  }

  void removeControl() {
    try {
      cp5.getController("Importer").remove();
      cp5.getController("Back").remove();
      cp5.getController("Logout").remove();
      importText.remove();
      error.setText("");
      cp5.getController("Error").remove();
    } 
    catch(Exception e) {
    }
  }
} //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
