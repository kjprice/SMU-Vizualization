boolean countryIsMentioned(String country, String searchResult) {
  return searchResult.contains(country);
}

void incrementCountryCountFromSearchResult(String searchResult) {
  for (int i = 0; i < countries.length; i++) {
    Country country = countries[i];
    String[] countryNames = country.getNames();
    for (int n = 0; n < countryNames.length; n++) {
      String countryName = countryNames[n];
      if (countryIsMentioned(countryName.toLowerCase(), searchResult.toLowerCase())) {
        println(countryName, searchResult);
      }
    }
  }
}