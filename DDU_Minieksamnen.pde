import controlP5.*;
import samuelal.squelized.*;

ControlP5 cp5;

color[] standardColors = {color(#ff3636),color(#435c27), color(#161759), color(#4e4f4a), color(#ebebeb)};

Scene[] scenes = {new FrontPage()}; 
int currentScene = 0;

void setup(){
  fullScreen();
  cp5= new ControlP5(this);
  
  scenes[0].inizializeControl();
 
}

void draw(){
background(#ebebeb);
}

void keyPressed(){
  scenes[0].removeControl();
}
