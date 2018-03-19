Dashboard dashboard;

void setup() {
  size(1100, 800);
  Table table = loadTable("newData.csv", "header");
  dashboard = new Dashboard(table);
}

void draw(){
  if (frameCount == 1) {
    dashboard.prerender();
  }
  background(180);
  dashboard.draw();
}