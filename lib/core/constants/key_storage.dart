enum keys { apiKey, base_url }

extension GetKeys on keys {
  String get rawValue {
    switch (this) {
      case keys.apiKey:
        return "";
      case keys.base_url:
        return "https://maps.googleapis.com/maps/api/place/";
    }
  }
}