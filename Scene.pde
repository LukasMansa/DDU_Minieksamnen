interface Scene {
  void inizializeControl();
  void removeControl();
}

public class FrontPage implements Scene {
  Textarea headerText;  

  void inizializeControl() {
    cp5.addButton("Login") // makes the button that logs in
      .setCaptionLabel("Log in")
      .setPosition(width/2 - 100, 300)
      .setSize(200, 19)
      .setColorBackground(0xff161759)
      ;

    cp5.addTextfield("Username")
      .setCaptionLabel("Brugernavn")
      .setPosition(width/2 - 100, 150)
      .setSize(200, 40)
      .setFocus(true)
      .setColor(color(#ebebeb))
      .setColorCaptionLabel(color(#4e4f4a))
      ;

    cp5.addTextfield("Password")
      .setCaptionLabel("Kode")
      .setPosition(width/2 - 100, 225)
      .setSize(200, 40)
      .setFocus(false)
      .setColor(color(#ebebeb))
      .setColorCaptionLabel(color(#4e4f4a))
      .setPasswordMode(true)
      ;

    this.headerText = cp5.addTextarea("txt")
      .setPosition(width/2 - 150, 75)
      .setSize(300, 50)
      .setFont(createFont("arial", 12))
      .setLineHeight(14)
      .setColor(color(128))
      //.setColorBackground(color(255, 100))
      //.setColorForeground(color(255, 100));
      ;
    headerText.setText("H.C. Ørsted gymnasiet: Test af faglige evner");
  }

  void removeControl() {

    try {
      cp5.getController("Login").remove();
      cp5.getController("Password").remove();
      cp5.getController("Username").remove();
      headerText.remove();
    }
    catch(Exception e) {
    }
  }
}
