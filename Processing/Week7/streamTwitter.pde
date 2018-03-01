class StreamTwitter {
  ArrayList<String> tweets = new ArrayList<String>();
  
  StreamTwitter() {
    this.fetchQuery();
  }
  
  private void fetchQuery() {
    listener = new StatusListener(){
      public void onStatus(Status status) {
        String tweet = status.getText();
        
        if (!tweets.contains(tweet)) {
          analyzeTwitterResults(tweet);
          tweets.add(tweet);
        }
      }
      public void onStallWarning(StallWarning warning) {}
      public void onScrubGeo(long num1, long num2) {}
      public void onDeletionNotice(StatusDeletionNotice statusDeletionNotice) {}
      public void onTrackLimitationNotice(int numberOfLimitedStatuses) {}
      public void onException(Exception ex) {
        ex.printStackTrace();
      }
    };
    twitterStream.addListener(listener);
    twitterStream.filter("#nbcolympics", "#olympic", "#winterolympics", "#pyeongchang2018");
  }
}