class Sun {
  int sunSize = 5;
  Sun() {}
  void draw(float x, float y) {
    int z = 40;
    spotLight(51, 102, 126, x, y, z, -1, 0, 0, PI/2, 200);
    pushMatrix();
    // TODO: Size of sun and distance from Earth
    translate(x, y, z);
    ambientLight(255, 204, 0);
   //fill(200, 220, 0);
    sphere(sunSize);
   // Sunlight
    fill(200, 155, 255, 64);
    sphere(sunSize*6);
    popMatrix();
  }
}