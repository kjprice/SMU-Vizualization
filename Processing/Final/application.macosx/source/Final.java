import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Final extends PApplet {

SolarSystem solarSystem;
UserDashboard userDashboard;
UserInteractions userInteractions;

public void setup() {
  
  userInteractions = new UserInteractions(this);
  solarSystem = new SolarSystem(this);
  userDashboard = new UserDashboard(this, solarSystem, userInteractions);
}

public void draw() {
  solarSystem.draw();
  userDashboard.draw();
}

public void mouseClicked() {
  userInteractions.checkIfClicked();
}
  public void settings() {  size(800, 600, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Final" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
