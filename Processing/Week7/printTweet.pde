public class PrintTweet {
  private float lastTweetTextPositionX;
  private float lastTweetTextPositionY;
  private float lastMatchedTweetTextPositionX;
  private float lastMatchedTweetTextPositionY;
  
  PrintTweet() {
    this.lastTweetTextPositionX = width / 40;
    this.lastTweetTextPositionY = height - 40;
    this.lastMatchedTweetTextPositionX = lastTweetTextPositionX;
    this.lastMatchedTweetTextPositionY = height - 20;
  }

  PrintTweet(float x1, float y1, float x2, float y2) {
    this.lastTweetTextPositionX = x1;
    this.lastTweetTextPositionY = y1;
    this.lastMatchedTweetTextPositionX = x2;
    this.lastMatchedTweetTextPositionY = y2;
  }

  private void printLastTweet() {
    textSize(18);
    float x = lastTweetTextPositionX;
    float y = lastTweetTextPositionY;
    if (streamTwitter.tweets.size() > 0) {
      String lastTweet = streamTwitter.tweets.get(streamTwitter.tweets.size() - 1).replace("\n", "");
      
      text("Last Tweet: " + lastTweet, lastTweetTextPositionX, lastTweetTextPositionY);
    }
    else {
      printLoadingMessage("Connecting to Twitter API...", x, y);
    }
  }
  
  private void printLastMatchedTweet() {
    textSize(18);
    float x = lastMatchedTweetTextPositionX;
    float y = lastMatchedTweetTextPositionY;
    if (matchedTweets.size() > 0) {
      String lastTweet = matchedTweets.get(matchedTweets.size() - 1).replace("\n", "");
      
      text("Matched Tweet: " + lastTweet, x, y);
    }
    else {
      printLoadingMessage("Looking for tweets matching one of the countries...", x, y);
    }
  }
  
  private void printLoadingMessage(String message, float x, float y) {
    textSize(18);
    text(message, x, y);  
  }
  
  
  public void printLastTweets() {
    printLastTweet();
    printLastMatchedTweet();
  }
}