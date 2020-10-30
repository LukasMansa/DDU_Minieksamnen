interface Scene {
  void inizializeControl();
  void removeControl();
}

public class FrontPage implements Scene {
  Textarea headerText;  

  void inizializeControl() {
    cp5.addButton("Login")
      .setValue(100)
      .setPosition(width/2 - 100, 300)
      .setSize(200, 19)
      .setColorBackground(0xff161759)
      ;

    cp5.addTextfield("Username")
      .setPosition(width/2 - 100, 150)
      .setSize(200, 40)
      .setFocus(true)
      .setColor(color(#ebebeb))
      .setColorCaptionLabel(color(#4e4f4a))
      ;

    cp5.addTextfield("Password")
      .setPosition(width/2 - 100, 225)
      .setSize(200, 40)
      .setFocus(true)
      .setColor(color(#ebebeb))
      .setColorCaptionLabel(color(#4e4f4a))
      ;

     this.headerText = cp5.addTextarea("txt")
      .setPosition(width/2 - 150, 75)
      .setSize(300, 100)
      .setFont(createFont("arial", 12))
      .setLineHeight(14)
      .setColor(color(128))
      //.setColorBackground(color(255, 100))
      //.setColorForeground(color(255, 100));
      ;
    headerText.setText("H.C. Ørsted gymnatiet: Test af faglige evner");
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

public void Login() {
  println("Hello");

  println(cp5.get(Textfield.class, "Username").getText());
  println(cp5.get(Textfield.class, "Password").getText());
}
