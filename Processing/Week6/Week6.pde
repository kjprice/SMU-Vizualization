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

void setup() {
  size(500, 500);
  setupAuthentication();

  // Setup flag defaults
  flagSpeed = width / 20;
  flagWidth = int(width / 10);
  flagHeight = int(flagWidth * 0.5);
  verticalSpaceBetweenFlags = width / 15 + flagHeight;
  flagsXStartingPosition = width / 40 + flagWidth/2;

  //Make the twitter object and prepare the query
  twitterStream = new TwitterStreamFactory(cb.build()).getInstance();
  fetchQuery();

  setupFlags();
}

void draw() {
  drawFlags();
}