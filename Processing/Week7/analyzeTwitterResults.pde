ArrayList<String> matchedTweets = new ArrayList<String>();


boolean countryIsMentioned(Country country, String tweet) {
  String[] countryNames = country.getNames();
  for (int n = 0; n < countryNames.length; n++) {
    String countryName = countryNames[n];
    if(tweet.contains(countryName)) {
      return true;
    }
  }
  
  return false;
}

void incrementCountriesCountFromSearchResult(String tweet) {
  for (int i = 0; i < countries.length; i++) {
    Country country = countries[i];
    if(countryIsMentioned(country, tweet.toLowerCase())) {
      matchedTweets.add(tweet);
      country.receiveMentionFromTwitter();
    }
  }
}

void analyzeTwitterResults(String tweet) {
  incrementCountriesCountFromSearchResult(tweet);
}