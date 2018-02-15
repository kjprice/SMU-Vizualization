// With help setting up twitter from http://blog.blprnt.com/blog/blprnt/updated-quick-tutorial-processing-twitter
// Make sure that a tab exists by the name of authentication with function called `setupAuthentication` which creates the credentials needed for twitter
ConfigurationBuilder cb;
ArrayList<String> words = new ArrayList();

StatusListener listener;
TwitterStream twitterStream;

float flagSpeed;
float verticalSpaceBetweenFlags;
float flagsXStartingPosition;

void setup() {
  size(500, 500);
  setupAuthentication();
  
  flagSpeed = width / 20; // arbitrary speed
  verticalSpaceBetweenFlags = width / 15;
  flagsXStartingPosition = width / 40;

  //Make the twitter object and prepare the query
  twitterStream = new TwitterStreamFactory(cb.build()).getInstance();
  fetchQuery();

  setupFlags();
}

void draw() {
  drawFlags();
}