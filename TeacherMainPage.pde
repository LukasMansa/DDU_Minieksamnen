public class TeacherMainPage implements Scene {
  Textarea yourTests;

  void inizializeControl() {
    // rendes the header of the page
    yourTests = cp5.addTextarea("txt")
      .setPosition(100, 100)
      .setSize(200, 200)
      .setFont(createFont("arial", 42))
      .setLineHeight(14)
      .setColor(color(#4e4f4a))
      //.setColorBackground(color(255, 100))
      //.setColorForeground(color(255, 100));
      ;
    yourTests.setText("Dine Test");

    cp5.addButton("Ny Test")
      .setPosition(width*0.1, height*0.4)
      .setSize(75, 25)
    //.setColorBackground(color(255, 100))
    //.setColorForeground(color(255, 100));
    ;

    // logout button
    cp5.addButton("Logout")
      //.setFont(createFont("arial", 18))
      .setPosition(width*0.9, 75)
      .setSize(75, 25)
      ;
  }

  void removeControl() {
    try {
      yourTests.remove();
      cp5.getController("Ny Test").remove();
      cp5.getController("Logout").remove();
    }
    catch(Exception e) {
    }
  }
}

public void Logout() {
  changeScene(currentScene, 0);
}
