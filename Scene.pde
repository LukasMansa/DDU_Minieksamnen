interface Scene {
  void inizializeControl();
  void removeControl();
}

public class FrontPage implements Scene {
  Textarea headerText;  

  void inizializeControl() {
    cp5.addButton("Login") // makes the button that logs in
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
  if (frameCount>0) {
    String name = cp5.get(Textfield.class, "Username").getText();
    name =  db.escape(name);
    String password = cp5.get(Textfield.class, "Password").getText();
    password = db.escape(password);
    String query = "SELECT * FROM Students WHERE StudentName='" + name + "' AND Password='" + encrypt.encrypt(password) + "'";
    db.query(query);
    if (db.next()) {
      println("Login Successfull");
      if (!db.getBoolean("isTeacher")) {
        changeScene(0, 1);
      } else {
        changeScene(0, 2); // TODO: change to teacher page
      }
    }
  }
}
