boolean countryIsMentioned(Country country, String searchResult) {
  String[] countryNames = country.getNames();
  for (int n = 0; n < countryNames.length; n++) {
    String countryName = countryNames[n];
    if(searchResult.contains(countryName)) {
      return true;
    }
  }
  
  return false;
}

void incrementCountriesCountFromSearchResult(String searchResult) {
  for (int i = 0; i < countries.length; i++) {
    Country country = countries[i];
    if(countryIsMentioned(country, searchResult.toLowerCase())) {
      println(country, searchResult);
    }
  }
}