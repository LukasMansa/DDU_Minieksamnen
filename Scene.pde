interface Scene{
  void render();
  void inizializeControl();
}

 class FrontPage implements Scene{
  
  void render(){
  
  }
  
  void inizializeControl(){
    cp5.addButton("Login")
     .setValue(100)
     .setPosition(100,120)
     .setSize(200,19)
     .setColorBackground(0xff161759)
     ;
  }
  
  
  void removeControl(){
    
  }
  
}
