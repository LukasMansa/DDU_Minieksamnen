public class StudentMainPage implements Scene {
  Textarea yourTest;

  void inizializeControl() {
    // rendes the header of the page
    yourTest = cp5.addTextarea("txt")
      .setPosition(100, 100)
      .setSize(200, 200)
      .setFont(createFont("arial", 42))
      .setLineHeight(14)
      .setColor(color(#4e4f4a))
      //.setColorBackground(color(255, 100))
      //.setColorForeground(color(255, 100));
      ;
    yourTest.setText("Dine Test");

    // Logout button
    cp5.addButton("Logout")
      //.setFont(createFont("arial", 18))
      .setPosition(width*0.9, 75)
      .setSize(75, 25)
      ;   
  }

  void removeControl() {
    try {
      yourTest.remove();
      cp5.getController("Logout").remove();
    }
    catch(Exception e) {
    }
  }
}

public void Logout() {
  changeScene(currentScene, 0);
}
