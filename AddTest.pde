class AddTest implements Scene {
  Textarea headerText2;
  Textarea headerText3;

  void inizializeControl() {
    cp5.addButton("Back")
      .setCaptionLabel("Tilbage")
      .setFont(createFont("arial", 10))
      .setPosition(width*0.1, height*0.1)
      .setSize(75, 25)
      .setBroadcast(false) //<>//
      .setValue(3) //<>//
      .setBroadcast(true)
      ;

    cp5.addButton("Logout")
      .setCaptionLabel("Log ud")
      .setFont(createFont("arial", 10))
      .setPosition(width*0.9, 75) //<>//
      .setSize(75, 25)
      ;
    cp5.addTextfield("TestName")
      .setCaptionLabel("Test navn")
      .setFont(createFont("arial", 10))
      .setPosition(width/2 - 100, 100)
      .setSize(200, 40)
      .setFocus(true)
      .setColor(color(#ebebeb))
      .setColorCaptionLabel(color(#4e4f4a))
      ;

    cp5.addButton("ChooseTeam")  //Her skal man kunne vælge klasser som man underviser i.
      .setCaptionLabel("Vælg hold")
      .setFont(createFont("arial", 10))
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

    cp5.addButton("Add")  //Her skal man kunne vælge klasser som man underviser i.
      .setCaptionLabel("Opret")
      .setFont(createFont("arial", 10))
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

    cp5.addButton("Save")
      .setCaptionLabel("Gem")
      .setFont(createFont("arial", 10))
      .setPosition(width/2-100, 300)
      .setSize(75, 25)
      ;
  }
  void removeControl() {
    try {
      cp5.getController("Logout").remove();
      cp5.getController("TestName").remove();
      cp5.getController("ChooseTeam").remove();
      cp5.getController("Back").remove();
      cp5.getController("Add").remove();
      cp5.getController("Save").remove();
      headerText2.remove();
      headerText3.remove();
    }
    catch(Exception e) {
    }
  }
}
public void Opret() {
  changeScene(currentScene, 3);
}
