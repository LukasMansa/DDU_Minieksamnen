import java.io.*; //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
import org.apache.poi.ss.usermodel.Sheet;
import controlP5.*; //<>// //<>// //<>// //<>// //<>//
import de.bezier.data.sql.*;
import java.util.*;
ControlP5 cp5;

color[] standardColors = {color(#ff3636), color(#435c27), color(#161759), color(#4e4f4a), color(#ebebeb)};
int personID; 

Scene[] scenes = {new FrontPage(), new StudentMainPage(), new TakeTest(), new AddQuestion(), new AddTest(), new TeacherMainPage(), new Team(), new Results(), new Statistics(), new Import()}; 
int currentScene = 0;
int boxSelected = 0;
SQLite db;
Encryption encrypt;

void setup() {
  fullScreen();
  encrypt = new Encryption();
  db = new SQLite(this, "minieksamen.db"); //setup connection to database

  // terminates the program if there is no connection.
  assert db.connect(): 
  "Connection failed";

  //  String makeSomeUsers = "INSERT INTO Students (StudentName, Password, Class, IsTeacher) VALUES ('john1234', '"+encrypt.encrypt("a")+"', 'teacherClass', '1')";
  //String showUsers = "SELECT * FROM Tests";
  //String query = "UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME='Tests';";
  //db.query(query);
  // query = "DELETE FROM Tests";
  //db.query(query);
  //  query = "DELETE FROM Questions";
  //db.query(query);
  //  query = "DELETE FROM Scores";
  //db.query(query);
  //String[] tableNames = db.getTableNames();
  // db.query(makeSomeUsers);
  //  db.query(showUsers);  
  //while(db.next()) {
  //    println(db.getInt("TestId"));
  // }

  cp5= new ControlP5(this);

  cp5.setFont(createFont("Arial", 11), 11); //<>// //<>//

  scenes[currentScene].inizializeControl(); //<>// //<>//
} //<>// //<>//
 //<>// //<>//

void draw() {
  background(#ebebeb);
}


void changeScene(int fromIndex, int toIndex) {
  scenes[fromIndex].removeControl(); 
  scenes[toIndex].inizializeControl(); 
  currentScene = toIndex;
} 


void changeScene(Scene toScene) {
  scenes[currentScene].removeControl();
  toScene.inizializeControl();
  currentScene = 0;
}

void reset() {
  cp5 = new ControlP5(this);
}

void keyPressed() {
  if (key == ENTER) {
    if (currentScene == 0) {
      Login();
    }
  }
  if (key == TAB) {
    if (currentScene == 0) {
      if (boxSelected == 0) {
        cp5.get(Textfield.class, "Username").setFocus(false);
        cp5.get(Textfield.class, "Password").setFocus(true);
        boxSelected = 1;
      } else {
        cp5.get(Textfield.class, "Username").setFocus(true);
        cp5.get(Textfield.class, "Password").setFocus(false);
        boxSelected = 0;
      }
    }
  }
}
