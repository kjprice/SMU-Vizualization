class Moon {
  Moon() {}
  void draw(float x, float y) {
    int z = 40;
    spotLight(51, 102, 126, x, y, z, -1, 0, 0, PI/2, 200);
    pushMatrix();
    // TODO: Size of sun and distance from Earth
    translate(x, y, z);
    ambientLight(255, 204, 0);
    sphere(5);
    popMatrix();
  }
}