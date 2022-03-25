abstract class IUserManager {
  void saveToken(String token);
  void clearData();
}

class UserManager extends IUserManager {
  String? userManagertoken;
  bool isLogin = false;
  @override
  void clearData() {
    _changeLoginValue(false);
  }

  void _changeLoginValue(bool value) {
    isLogin = value;
  }

  @override
  void saveToken(String? token) {
    userManagertoken = token;
    _changeLoginValue(true);
  }
}