class AddTest implements Scene {
  Textarea headerText2;
  Textarea headerText3;

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
    cp5.addTextfield("Test navn")
      .setPosition(width/2 - 100, 100)
      .setSize(200, 40)
      .setFocus(true)
      .setColor(color(#ebebeb))
      .setColorCaptionLabel(color(#4e4f4a))
      ;

    cp5.addButton("Vælg hold")  //Her skal man kunne vælge klasser som man underviser i.
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
    headerText2.setText("Hold:");

    cp5.addButton("Opret")  //Her skal man kunne vælge klasser som man underviser i.
      .setPosition(width/2, 400) //Vis bogstav æ i vÆlg hold.
      .setSize(75, 25)
      ;

    this.headerText3 = cp5.addTextarea("ht3")
      .setPosition(width/2, 350)
      .setSize(100, 50)
      .setFont(createFont("arial", 12))
      .setLineHeight(12)
      .setColor(color(128))
      ;
    headerText3.setText("Opret spørgsmål");
    
    cp5.addButton("Gem")
      .setPosition(width/2-100, 300)
      .setSize(75, 25)
      ;
  }
  void removeControl() {
    try {
      cp5.getController("Logout").remove();
      cp5.getController("Test navn").remove();
      cp5.getController("Vælg hold").remove();
      cp5.getController("Back").remove();
      cp5.getController("Opret").remove();
      cp5.getController("Gem").remove();
      headerText2.remove();
      headerText3.remove();
    }
    catch(Exception e) {
    }
  }
}
public void Opret() {
    changeScene(currentScene,3);
  }
