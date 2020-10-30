interface Scene {
  void inizializeControl();
  void removeControl();
}

public class FrontPage implements Scene {
  void inizializeControl() {
    cp5.addButton("Login")
      .setValue(100)
      .setPosition(width/2 - 100, 250)
      .setSize(200, 19)
      .setColorBackground(0xff161759)
      ;

    cp5.addTextfield("Username")
      .setPosition(width/2 - 100, 100)
      .setSize(200, 40)
      .setFocus(true)
      .setColor(color(#ebebeb))
      .setColorCaptionLabel(color(#4e4f4a))
      ;

    cp5.addTextfield("Password")
      .setPosition(width/2 - 100, 175)
      .setSize(200, 40)
      .setFocus(true)
      .setColor(color(#ebebeb))
      .setColorCaptionLabel(color(#4e4f4a))
      ;
  }

  void removeControl() {
    try {
      cp5.getController("Login").remove();
      cp5.getController("Password").remove();
      cp5.getController("Username").remove();
    }
    catch(Exception e) {
    }
  }
  
}

public void Login() {
  println("Hello");
  
  println(cp5.get(Textfield.class,"Username").getText());
  println(cp5.get(Textfield.class,"Password").getText());
}
