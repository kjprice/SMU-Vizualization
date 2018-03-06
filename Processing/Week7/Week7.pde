// With help setting up twitter from http://blog.blprnt.com/blog/blprnt/updated-quick-tutorial-processing-twitter

ArrayList<String> words = new ArrayList();
int startSecond = second();
int frameRate=30;
int currentSecond;

ConfigurationBuilder cb;
StopWatchTimer sw; 
StreamTwitter streamTwitter;
PrintTweet printTweet;
Flag flag;
StatusListener listener;
TwitterStream twitterStream;

void setup() {
  size(1500, 800);
  setupAuthentication();
  setupFlags();

  twitterStream   = new TwitterStreamFactory(cb.build()).getInstance();
  streamTwitter   = new StreamTwitter();
  printTweet      = new PrintTweet();
  flag            = new Flag();
  sw              = new StopWatchTimer();
}

void draw() {
  currentSecond = second();
  flag.drawFlags();  
  printTweet.printLastTweets();
  textOfTime();
}