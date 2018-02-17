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
int frames=0;

void setup() {

  size(1500, 800);
  setupAuthentication();
  frameRate(30);
  // Setup flag defaults
  flagSpeed = width / 40;
  flagWidth = int(width / 10);
  flagHeight = int(flagWidth * 0.5);
  verticalSpaceBetweenFlags = flagHeight/1.5;
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
}

void draw() {
  int currentSecond = second();
  //get the previous score to calculate change of score
  if (currentSecond==startSecond && frames%30==0){
    for (int i = 0; i < countries.length; i++) {
      Country country = countries[i];
      country.previousScore=country.getCurrentScore();
    }
  }  
  //get curve points
  if(currentSecond==startSecond-1 && frames%30==0){
     for (int i = 0; i < countries.length; i++) {
        Country country = countries[i];
        if(country.thisScore!=0){
          country.previousScore=country.thisScore;
        }
        country.thisScore=country.getCurrentScore();
        country.changeScore=country.thisScore-country.previousScore;
        country.curveVertexX.append(int(flagSpeed));
        country.curveVertexY.append(int(country.curveFlagPositionY-country.changeScore*5));
        country.curveFlagPositionY=int(country.curveFlagPositionY-country.changeScore*5);
      }
     flagSpeed+=width / 40;
   }
  frames+=1;
  drawFlags();  
  printLastTweets();
}