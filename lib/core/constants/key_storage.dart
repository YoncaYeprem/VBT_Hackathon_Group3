enum keys { apiKey }

extension GetKeys on keys {
  String get rawValue {
    switch (this) {
      case keys.apiKey:
        return "AIzaSyCARKG3wS6Eg2fFqT2zuEZ-WY8de6fftPs";
    }
  }
}
