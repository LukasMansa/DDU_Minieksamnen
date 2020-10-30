import controlP5.*;
import de.bezier.data.sql.*;

ControlP5 cp5;

color[] standardColors = {color(#ff3636), color(#435c27), color(#161759), color(#4e4f4a), color(#ebebeb)};

SQLite db;
Encryption encrypt;

Scene[] scenes = {new FrontPage(), new StudentMainPage(), new TakeTest()};
int currentScene = 0;


void setup() {
  fullScreen();
  encrypt = new Encryption();
  db = new SQLite(this, "minieksamen.db"); //setup connection to database
  if (!db.connect()) {
    println("Connection failed");
  }

  //  String makeSomeUsers = "INSERT INTO Students (StudentName, Password, Class, IsTeacher) VALUES ('john1234', '"+encrypt.encrypt("a")+"', 'teacherClass', '1')";
  //String showUsers = "SELECT * FROM Students";
  //String[] tableNames = db.getTableNames();
  // db.query(makeSomeUsers);
  //  db.query(showUsers);  
  // while(db.next()) {
  //      println(db.getString(2));
  // }

  cp5= new ControlP5(this);

  scenes[currentScene].inizializeControl();
}

void draw() {
  background(#ebebeb);
}



  void keyPressed() {
  //scenes[0].removeControl();
}

void changeScene(int fromIndex, int toIndex) {
  scenes[fromIndex].removeControl();
  scenes[toIndex].inizializeControl();
  currentScene = toIndex;
}

//void changeScene(Scene toScene) {
//  scenes[currentScene].removeControl();
//  toScene.inizializeControl();
//}
