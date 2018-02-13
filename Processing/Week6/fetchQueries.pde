void fetchQuery() {
  //Try making the query request.
  try {
    QueryResult result = twitter.search(query);
 
    for (Status status : result.getTweets()) {
      String user = status.getUser().getScreenName();
      String msg = status.getText();
      incrementCountryCountFromSearchResult(msg);
       
      //Break the tweet into words
      String[] input = msg.split(" ");
      for (int j = 0;  j < input.length; j++) {
       //Put each word into the words ArrayList
       words.add(input[j]);
      }
    };
  }
  catch (TwitterException te) {
    println("Couldn't connect: " + te);
  };
}