SolarSystem solarSystem;
import processing.sound.*;
  
  SoundFile file;
  //replace the sample.mp3 with your audio file name here
  String audioName = "data/sample.mp3";
  String path;
  
void setup() {
  size(800, 600, P3D);
  solarSystem = new SolarSystem();
    path = sketchPath(audioName);
    file = new SoundFile(this, path);
    file.play();
}

void draw() {
  solarSystem.draw();
}