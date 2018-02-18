void ruler(){
  int spacing=(height - height/10)/int((1.5*10));
  int change=0;
  strokeWeight(3);
  stroke(0);
  line(width-1.5,height - height/10,width-1.5,0);
  for (int i = height-height/10; i>=0; i-=spacing){
    strokeWeight(1);
    //stroke(192,220,233);
    stroke(0);
    line(width-1.5,i,100,i);
    strokeWeight(3);
    stroke(0);
    line(width-1.5,i,width-15,i);
    println(width-1.5,i,width-15,i);
    fill(0);
    textSize(18);
    text(change,width-50,i+8);
    change+=10;
  }
  println("spacing",spacing);
}