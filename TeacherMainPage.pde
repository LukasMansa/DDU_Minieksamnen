Textarea yourTests1; //<>//
Textarea yourTests2;

public class TeacherMainPage implements Scene {
  Textarea yourTests;

  TeacherMainPage() {
  }

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
      .setFont(createFont("arial", 10))
      .setPosition(width*0.1, height*0.4)
      .setSize(75, 25)
      //.setColorBackground(color(255, 100))
      //.setColorForeground(color(255, 100));
      ;

    // logout button
    cp5.addButton("Logout")
      .setCaptionLabel("Log ud")
      .setFont(createFont("arial", 10))
      .setPosition(width*0.9, 75)
      .setSize(75, 25)
      ;

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


    //Status test button
    cp5.addButton("Status1")
      .setCaptionLabel("Start")
      .setFont(createFont("arial", 10))
      .setPosition(width/2, height/2)
      .setSize(75, 25)
      ;
    yourTests1 = cp5.addTextarea("txt")
      .setPosition(width/2-200, height/2)
      .setSize(200, 200)
      .setFont(createFont("arial", 42))
      .setLineHeight(14)
      .setColor(color(#4e4f4a))
      //.setColorBackground(color(255, 100))
      //.setColorForeground(color(255, 100));
      ;
    yourTests1.setText("Lukket");

    //yourTests2 = cp5.addTextarea("txt")
    //  .setPosition(width/2-400, height/2)
    //  .setSize(200, 200)
    //  .setFont(createFont("arial", 42))
    //  .setLineHeight(14)
    //  .setColor(color(#4e4f4a))
    //  ;
    //yourTests2.setText("Status:");
  }

  void removeControl() {
    try {
      cp5.getController("NewTest").remove();
      cp5.getController("Logout").remove();
      cp5.getController("Status1").remove();
      yourTests.remove();
    }
    catch(Exception e) {
    }
  }
}

public void NewTest() {
  changeScene(currentScene, 4);
}

public void Status1() {
  yourTests1.setText("Åben");
  cp5.getController("Status1").remove();
  cp5.addButton("Status2")
    .setCaptionLabel("Afslut")
    .setFont(createFont("arial", 10))
    .setPosition(width/2, height/2)
    .setSize(75, 25)
    ;
  cp5.addButton("Administrate")
    .setCaptionLabel("Administrer")
    .setFont(createFont("arial", 10))
    .setPosition(width/2+80, height/2)
    .setSize(200, 25)
    ;
}

public void Status2() {
  yourTests1.setText("Afsluttet");
  cp5.getController("Status2").remove();
  cp5.getController("Administrate").remove();
  cp5.addButton("Answers")
    .setCaptionLabel("Se besvarelser")
    .setFont(createFont("arial", 10))
    .setPosition(width/2, height/2)
    .setSize(200, 25)
    ;
}

public void Administrate() {
  changeScene(currentScene, 4);
  cp5.getController("Administrate").remove();
  cp5.getController("Status2").remove();
  yourTests1.remove();
}
