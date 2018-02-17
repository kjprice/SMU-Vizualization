void printLastTweet() {
  textSize(18);
  float x = lastTweetTextPositionX;
  float y = lastTweetTextPositionY;
  if (tweets.size() > 0) {
    String lastTweet = tweets.get(tweets.size() - 1).replace("\n", "");
    
    text("Last Tweet: " + lastTweet, lastTweetTextPositionX, lastTweetTextPositionY);
  }
  else {
    printLoadingMessage("Connecting to Twitter API...", x, y);
  }
}

void printLastMatchedTweet() {
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

void printLoadingMessage(String message, float x, float y) {
  textSize(18);
  text(message, x, y);  
}


void printLastTweets() {
  printLastTweet();
  printLastMatchedTweet();
}