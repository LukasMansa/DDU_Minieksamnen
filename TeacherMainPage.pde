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
    yourTests.setText("Dine Tests");

    cp5.addButton("NewTest")
      .setCaptionLabel("Ny Test")
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
      cp5.getController("NewTest").remove();
      cp5.getController("Logout").remove();
    }
    catch(Exception e) {
    }
  }
}

public void NewTest() {
  changeScene(currentScene, 4);
}
