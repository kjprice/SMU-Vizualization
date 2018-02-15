boolean countryIsInString(String country, String searchResult) {
  return searchResult.contains(country);
}

void incrementCountryCountFromSearchResult(String searchResult) {
  for (int i = 0; i < countries.length; i++) {
    Country country = countries[i];
    String countryName = country.getName();
    println(countryName);
    if (countryIsInString("#"+countryName.toLowerCase(), searchResult.toLowerCase())) {
      println(country, searchResult);
    }
  }
}