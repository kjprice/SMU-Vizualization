class Viz3 extends Visualization{
  int vizualizationNum = 3;
  String heading = "Viz3";
  
  FloatList homicide;// = new float [developed]; //homicides count
  FloatList guns;// = new float [developed]; //guns per 100 in country
  FloatList suicide; //suicide count
  
    

  
  Viz3(){}
  
  //fill arrays with values from developed countries
  void fillArrays(Table inputData){
    int i=0;
      for (TableRow row : inputData.rows()) {
         String economy = trim(row.getString("Developed"));
         //println(row.getString("Country"),row.getString("Developed"));
         if (economy.equals("Yes") == true) {
           i+=1;
           //println(row.getFloat("Guns.Per.Capita"));
            //guns.append(row.getFloat("Guns.Per.Capita"));
           // homicide.append(row.getFloat("Homicides"));
            //suicide.append(row.getFloat("Suicides"));
         }        
      }
      println(i);
  }
  
  void draw(Table inputData){
    //fill(255,60,30);
    //rect(0,0,width,height-400);
    //println(inputData.getColumnTitle(11));
    //for (int i=0; i<homicide.size(); i++){
    //     template(homicide.get(i)+suicide.get(i),guns.get(i),guns.get(i));
    //}
    //create float list of guns, homicides, suicides in developed countries

  }
  
  void template(float homicide,float suicide,float guns){
    ellipse(homicide+suicide, guns, guns*10, guns*10);
  }
  int getVizualizationNum(){
    return vizualizationNum;
  }
  
  String getHeading(){
    return heading;
  }
}