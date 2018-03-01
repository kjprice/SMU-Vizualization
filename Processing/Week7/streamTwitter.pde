// TODO: define duplicates

ArrayList<String> tweets = new ArrayList<String>();

void fetchQuery() {
  listener = new StatusListener(){
    public void onStatus(Status status) {
      // println(" ------ " + status.getUser().getName() + " : " + status.getText());
      // TODO: if this is a duplicate message, then stop
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