//Her skal læren komme hen når læren trykker på se besvarelser inde i StudentMainPage.
//Læren skal kun komme herind når læren har afsluttet testen.
class Results implements Scene {
  Textarea headerText1;
  String R = "Test 1"; 

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

    this.headerText1 = cp5.addTextarea("ht1")
      .setPosition(width/2-50, 100)
      .setSize(200, 200)
      .setFont(createFont("arial", 40))
      .setLineHeight(12)
      .setColor(color(128))
      ;
    headerText1.setText(R); //Her skal der stå navnet på testen som læren selv vælger når testen oprettes.

    cp5.addButton("Logout")
      .setCaptionLabel("Log ud")
      .setPosition(width*0.9, 75)
      .setSize(100, 50)
      .setColorBackground(0xff161759)
      ;
  }
  void removeControl() {
    try {
      cp5.getController("Logout").remove();
      cp5.getController("Back").remove();
      cp5.getController("").remove();
      headerText1.remove();
    }
    catch(Exception e) {
    }
  }
}
