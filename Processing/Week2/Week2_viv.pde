// Vivek global variables

static final String VIV_SELECTED_IMG = "images/viv_selfie_1.png";

static final int BV_STARTING_POSITION_X = 430;
static final int BV_STARTING_POSITION_Y = 25;

PImage VB_IMAGE;

void performSelfPortraitViv(){
   for(int i = 0 ; i < (width/2); i++){
     for(int j = 0; j < height-50; j++) {
        
        int x_trg =  i + BV_STARTING_POSITION_X;
        int y_trg =  j + BV_STARTING_POSITION_Y;
        
        color c = VB_IMAGE.get(i,j);
        fill(c);
        //println(i,j,x_trg,y_trg,c);
        
        ellipse(x_trg,y_trg,4,4);
     }
   }
}
        