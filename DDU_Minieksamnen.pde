import controlP5.*;
import samuelal.squelized.*;

ControlP5 cp5;

color[] standardColors = {color(#ff3636),color(#435c27), color(#161759), color(#4e4f4a), color(#ebebeb)};

Scene[] scenes = {new FrontPage(), new StudentMainPage(), new TakeTest()}; 
int currentScene = 2;

void setup(){
  fullScreen();
  cp5= new ControlP5(this);
  
  scenes[currentScene].inizializeControl();
 
}

void draw(){
background(#ebebeb);
}

void keyPressed(){
  //scenes[0].removeControl();
}



void changeScene(int fromIndex, int toIndex){
  scenes[fromIndex].removeControl();
  scenes[toIndex].inizializeControl();
}

void changeScene(Scene toScene){
  scenes[currentScene].removeControl();
  toScene.inizializeControl();

}
