interface Scene {
  void inizializeControl();
  void removeControl();
}

public class FrontPage implements Scene {
  void inizializeControl() {
    cp5.addButton("Login")
      .setValue(100)
      .setPosition(100, 120)
      .setSize(200, 19)
      .setColorBackground(0xff161759)
      ;
  }

  void removeControl() {
    try {
      cp5.getController("Login").remove();
    }
    catch(Exception e) {
    }
  }

  public void Login() {
    println("Hello");
  }
}
