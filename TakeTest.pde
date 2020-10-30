public class TakeTest implements Scene {

  void inizializeControl() {
    cp5.addButton("logout")
      //.setFont(createFont("arial", 18))
      .setPosition(width*0.9, 75)
      .setSize(75, 25)
      ;

    cp5.addButton("Afslut")
      //.setFont(createFont("arial", 18))
      .setPosition(width*0.9, 125)
      .setSize(75, 25)
      ;
  }

  void removeControl() {
    try {
      cp5.getController("logout").remove();
      cp5.getController("Afslut").remove();
    }
    catch(Exception e) {
    }
  }
}


public void Afslut() {
}
