import controlP5.*;
import de.bezier.data.sql.*;

ControlP5 cp5;

color[] standardColors = {color(#ff3636), color(#435c27), color(#161759), color(#4e4f4a), color(#ebebeb)};

Scene[] scenes = {new FrontPage(), new StudentMainPage(), new TakeTest(), new AddQuestion(), new AddTest(), new TeacherMainPage(), new AddOption(), new Team(), new Results(), new Statistics()}; 
int currentScene = 0;

SQLite db;
Encryption encrypt;

void setup() {
  fullScreen();
  encrypt = new Encryption();
  db = new SQLite(this, "minieksamen.db"); //setup connection to database

  // terminates the program if there is no connection.
  assert db.connect(): 
  "Connection failed";

  //  String makeSomeUsers = "INSERT INTO Students (StudentName, Password, Class, IsTeacher) VALUES ('chri12345', '"+encrypt.encrypt("abc")+"', 'teacherClass', '0')";
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

void changeScene(int fromIndex, int toIndex) { //<>// //<>//
  //<>// //<>//
  scenes[fromIndex].removeControl(); //<>// //<>//
  scenes[toIndex].inizializeControl(); //<>// //<>//
  currentScene = toIndex; //<>// //<>// //<>// //<>//
}


void changeScene(Scene toScene) {
  scenes[currentScene].removeControl();
  toScene.inizializeControl();
  currentScene = 0;
}
