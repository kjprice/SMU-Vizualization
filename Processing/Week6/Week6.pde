// With help setting up twitter from http://blog.blprnt.com/blog/blprnt/updated-quick-tutorial-processing-twitter
// Make sure that a tab exists by the name of authentication with function called `setupAuthentication` which creates the credentials needed for twitter
ConfigurationBuilder cb;
ArrayList<String> words = new ArrayList();

StatusListener listener;
Twitter twitter;

void setup() {
  setupCountriesList();
  setupAuthentication();

  //Make the twitter object and prepare the query
  twitter = new TwitterFactory(cb.build()).getInstance();
  query = new Query("#OLYMPICS");

  // Only pull 10 queries / second
  frameRate(10);
}

void draw() {
  fetchQuery();
}