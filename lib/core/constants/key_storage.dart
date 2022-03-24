enum keys { apiKey, base_url }

extension GetKeys on keys {
  String get rawValue {
    switch (this) {
      case keys.apiKey:
        return "AIzaSyCARKG3wS6Eg2fFqT2zuEZ-WY8de6fftPs";
      case keys.base_url:
        return "https://maps.googleapis.com/maps/api/place/";
    }
  }
}
