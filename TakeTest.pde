public class TakeTest implements Scene {

  int testID;
  Textarea testTitle;

  TakeTest(int _testID) {
    this.testID = _testID;
  }

  TakeTest() {
    this.testID= 0;
  }

  void inizializeControl() {
    cp5.addButton("Back")
    .setPosition(width*0.1,height*0.1)
    .setSize(45,25)
    .setBroadcast(false)
    .setValue(1)
    .setBroadcast(true)
    ;
    
    cp5.addButton("Logout")
      //.setFont(createFont("arial", 18))
      .setPosition(width*0.9, 75)
      .setSize(75, 25)
      ;

    cp5.addButton("Afslut")
      //.setFont(createFont("arial", 18))
      .setPosition(width*0.9, 125)
      .setSize(100, 50)
      ;

    testTitle = cp5.addTextarea("txt")
      .setPosition(100, 100)
      .setSize(200, 350)
      .setFont(createFont("arial", 42))
      .setLineHeight(14)
      .setColor(color(#4e4f4a))
      ;
      
    testTitle.setText("Temp Title");
  }

  void removeControl() {
    try {
      cp5.getController("Logout").remove();
      cp5.getController("Back").remove();
      cp5.getController("Afslut").remove();
      testTitle.remove();
    }
    catch(Exception e) {
    }
  }
}

public void Afslut() {
  println("Student test terminated");
}

public void Back(int theValue) {
  changeScene(currentScene, theValue);
}
