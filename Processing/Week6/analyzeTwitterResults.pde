boolean countryIsMentioned(Country country, String tweat) {
  String[] countryNames = country.getNames();
  for (int n = 0; n < countryNames.length; n++) {
    String countryName = countryNames[n];
    if(tweat.contains(countryName)) {
      return true;
    }
  }
  
  return false;
}

void incrementCountriesCountFromSearchResult(String tweat) {
  for (int i = 0; i < countries.length; i++) {
    Country country = countries[i];
    if(countryIsMentioned(country, tweat.toLowerCase())) {
      println(country, tweat);
    }
  }
}

void analyzeTwitterResults(String tweat) {
  incrementCountriesCountFromSearchResult(tweat);
}