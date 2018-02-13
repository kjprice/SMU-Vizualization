void fetchQuery() {
  listener = new StatusListener(){
    public void onStatus(Status status) {
      println(" ------ " + status.getUser().getName() + " : " + status.getText());
      incrementCountryCountFromSearchResult(status.getText());
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
  // sample() method internally creates a thread which manipulates TwitterStream and calls these adequate listener methods continuously.
  twitterStream.filter("#olympics");
}