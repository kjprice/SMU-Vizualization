// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/17WoOqgXsRM

// I create a "Star" Class.
import processing.core.*;
class Star {
  // I create variables to specify the x and y of each star.
  float x;
  float y;
  // I create "z", a variable I'll use in a formula to modify the stars position.
  float z;
  // I create an other variable to store the previous value of the z variable.
  // (the value of the z variable at the previous frame).
  float pz;
  PApplet p;

  Star(PApplet p) {
    this.p = p;
    
    x = p.random(-p.width/2, p.height/2);
    y = p.random(-p.width/2, p.height/2);
    z = p.random(p.width/4);
    // I set the previous position of "z" in the same position of "z",
    // which it's like to say that the stars are not moving during the first frame.
    pz = z;
  }

  void update() {
    // In the formula to set the new stars coordinates
    // I'll divide a value for the "z" value and the outcome will be
    // the new x-coordinate and y-coordinate of the star.
    // Which means if I decrease the value of "z" (which is a divisor),
    // the outcome will be bigger.
    // Wich means the more the speed value is bigger, the more the "z" decrease,
    // and the more the x and y coordinates increase.
    // Note: the "z" value is the first value I updated for the new frame.
    //z = z - speed;
    // when the "z" value equals to 1, I'm sure the star have passed the
    // borders of the canvas( probably it's already far away from the borders),
    // so i can place it on more time in the canvas, with new x, y and z values.
    // Note: in this way I also avoid a potential division by 0.
    if (z < 1) {
      z = p.width/4;
      x = p.random(-p.width/2, p.width/2);
      y = p.random(-p.height/2, p.height/2);
      pz = z;
    }
  }

  void show() {
   p.pushMatrix();
    // move stars backward
   p.translate(0, 0, -2000);

   p.fill(255);
   p.noStroke();

    // with theese p.map", I get the new star positions
    // the division x / z get a number between 0 and a very high number,
    // wep.map this number (proportionally to a range of 0 - 1), inside a range of 0 - p.width/2.
    // In this way we are sure the new coordinates "sx" and "sy" move faster at each frame
    // and which they finish their travel outside of the canvas (they finish when "z" is less than a).

    float sx =p.map(x / z, 0, 1, 0, p.width/2);
    float sy =p.map(y / z, 0, 1, 0, p.height/2);;

    // I use the z value to increase the star size between a range from 0 to 8.
    float r =p.map(z, 0, p.width/2, 8, 0);
   p.ellipse(sx, sy, r, r);

    // Here i use the "pz" valute to get the previous position of the stars,
    // so I can draw ap.line from the previous position to the new (current) one.
    float px =p.map(x / pz, 0, 1, 0, p.width/2);
    float py =p.map(y / pz, 0, 1, 0, p.height/2);

    // Placing here thisp.line of code, I'm sure the "pz" value are updated after the
    // coordinates are already calculated; in this way the "pz" value is always equals
    // to the "z" value of the previous frame.
    pz = z;

   p.stroke(255);
   p.line(px, py, sx, sy);
   p.popMatrix();

  }
}
