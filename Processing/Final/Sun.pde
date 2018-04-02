class Sun {
  Sun() {}
  void draw() {
    spotLight(51, 102, 126, frameCount/3, 20, 40, -1, 0, 0, PI/2, 200);
    pushMatrix();
    translate(frameCount/3, 20, 40);
    ambientLight(255, 204, 0);
    sphere(10);
    popMatrix();
  }
}
