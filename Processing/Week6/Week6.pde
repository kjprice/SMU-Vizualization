// With help setting up twitter from http://blog.blprnt.com/blog/blprnt/updated-quick-tutorial-processing-twitter
// Make sure that a tab exists by the name of authentication with function called `setupAuthentication` which creates the credentials needed for twitter
ConfigurationBuilder cb;
ArrayList<String> words = new ArrayList();

StatusListener listener;
TwitterStream twitterStream;

float flagSpeed;
float verticalSpaceBetweenFlags;
float flagsXStartingPosition;

int flagWidth;
int flagHeight;


float lastTweetTextPositionX;
float lastTweetTextPositionY;
float lastMatchedTweetTextPositionX;
float lastMatchedTweetTextPositionY;
int startSecond = second();
int frameRate=30;
int currentSecond;
StopWatchTimer sw = new StopWatchTimer(); 
  

void setup() {
  size(1500, 800);
  setupAuthentication();
  // Setup flag defaults
  flagSpeed = width / 60;
  flagWidth = int(width / 10);
  flagHeight = int(flagWidth * 0.5);
  verticalSpaceBetweenFlags = flagHeight/3.5;
  flagsXStartingPosition = width / 40 + flagWidth/2;
  // Setup text defaults
  lastTweetTextPositionX = width / 40;
  lastTweetTextPositionY = height - 40;
  lastMatchedTweetTextPositionX = lastTweetTextPositionX;
  lastMatchedTweetTextPositionY = height - 20;

  //Make the twitter object and prepare the query
  twitterStream = new TwitterStreamFactory(cb.build()).getInstance();
  fetchQuery();
  setupFlags();
  sw.start();//start timer
}

void draw() {
  currentSecond = second();
  //get curve points
  if(currentSecond==startSecond && frameCount%frameRate==0){
     for (int i = 0; i < countries.length; i++) {
        Country country = countries[i];
        if(country.thisScore!=0){
            country.previousScore=country.thisScore;
          }
        country.thisScore=country.getCurrentScore();
        country.changeScore=country.thisScore-country.previousScore;
        if(country.curveVertexX.size()<=width/25 - 2){//taking array of x positions   25=1500/60 60 - speed flag
          country.curveVertexX.append(int(flagSpeed));
          //y curve position boundary
          if (country.curveFlagPositionY-country.changeScore*7 >= 0 + flagHeight*2){
            country.curveVertexY.append(int(country.curveFlagPositionY-country.changeScore*7));
          }
          //if y of curve goes from the screen, y = 30;
          else{
            country.curveVertexY.append(30);
          }
        }
        //when we got all x positions
        else{
            //remove first y position of the curve
            country.curveVertexY.remove(0);
            //append new last y position of the curve
           if (country.curveFlagPositionY-country.changeScore*7 >= 0 + flagHeight*2){
              country.curveVertexY.append(int(country.curveFlagPositionY-country.changeScore*7));
            }
            //if y of curve goes from the screen, y = 30;
            else{
              country.curveVertexY.append(30);
            }
        }
      }
     flagSpeed+=width / 60;
   }
  drawFlags();  
  printLastTweets();
  textOfTime();
}