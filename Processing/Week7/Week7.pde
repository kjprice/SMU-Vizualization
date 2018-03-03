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


int startSecond = second();
int frameRate=30;
int currentSecond;
StopWatchTimer sw = new StopWatchTimer(); 
StreamTwitter streamTwitter;
PrintTweet printTweet;
Flag flag = new Flag();
  

void setup() {
  size(1500, 800);
  setupAuthentication();
  // Setup flag defaults
  flagSpeed = width / 60;
  flagWidth = int(width / 10);
  flagHeight = int(flagWidth * 0.5);
  verticalSpaceBetweenFlags = flagHeight/3.5;
  flagsXStartingPosition = width / 40 + flagWidth/2;

  //Make the twitter object and prepare the query
  twitterStream = new TwitterStreamFactory(cb.build()).getInstance();
  streamTwitter = new StreamTwitter();

  float lastTweetTextPositionX = width / 40;
  float lastTweetTextPositionY = height - 40;
  float lastMatchedTweetTextPositionX = lastTweetTextPositionX;
  float lastMatchedTweetTextPositionY = height - 20;
  printTweet = new PrintTweet(lastTweetTextPositionX, lastTweetTextPositionY, lastMatchedTweetTextPositionX, lastMatchedTweetTextPositionY);

  setupFlags();
  sw.start();//start timer
}

void draw() {
  currentSecond = second();
  flag.curve(currentSecond, startSecond, frameCount, frameRate, flagSpeed);
  flag.drawFlags();  
  printTweet.printLastTweets();
  textOfTime();
}