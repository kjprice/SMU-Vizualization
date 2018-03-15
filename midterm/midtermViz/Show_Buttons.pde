int button_start_x = 20;
int button_start_y = 720;
int offset = 100 ;
int button_w = 80;
int button_h = 50;

void displayButtons(){
  fill(25);
  noStroke();
  // buttons
  int start_x = button_start_x;
  int start_y = button_start_y;
  rect(start_x, start_y, button_w, button_h);
  start_x = start_x + offset;
  rect(start_x, start_y, button_w, button_h);
  start_x = start_x + offset;
  rect(start_x, start_y, button_w, button_h);
  start_x = start_x + offset;
  rect(start_x, start_y, button_w, button_h);
  start_x = start_x + offset;
  rect(start_x, start_y, button_w, button_h);
  start_x = start_x + offset;
  textAlign(LEFT);
  textSize(25);
  //fill(0);
  text(heading,start_x + 20,start_y+30);
}