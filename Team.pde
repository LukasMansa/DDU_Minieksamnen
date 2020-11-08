String selectedTeam = "";
ArrayList<String> classes = new ArrayList<String>();
class Team implements Scene {
  Textarea headerText1;

  void inizializeControl() {
     cp5.addButton("Back")
      .setPosition(width*0.1, height*0.1)
      .setSize(45, 25)
      .setBroadcast(false)
      .setValue(4)
      .setBroadcast(true)
      ;
    this.headerText1 = cp5.addTextarea("")
      .setPosition(width/2-100, 100)
      .setSize(200, 75)
      .setFont(createFont("arial", 50))
      .setLineHeight(12)
      .setColor(color(128))
      ;
    cp5.addButton("Logout")
      .setPosition(width*0.9, 75)
      .setSize(75, 25)
      ;
    headerText1.setText("Hold:");
    
    String query = "SELECT DISTINCT Class FROM Students WHERE Class != 'teacherClass'";
    db.query(query);
    while(db.next()) {
      classes.add(db.getString(1));
    }
    for(int i = 0; i<classes.size(); i++) {
       cp5.addButton("class"+classes.get(i))
        .setPosition(width/2-40,height*0.35+((i-1)*height/10)/classes.size())
        .setSize(80,25)
        .setCaptionLabel(classes.get(i))
        ;
        println(classes.get(i));
    }
  }
  void removeControl() {
    try {
      headerText1.remove();
      cp5.getController("Back").remove();
      cp5.getController("Logout").remove();
          for(int i = 0; i<classes.size(); i++) {
            cp5.getController("class"+classes.get(i)).remove();
          }
          classes.clear();
    }
    catch(Exception e) {
    }
  }
}
