import 'package:vbt_hackathon_group3/product/utils/cache/cache_manager.dart';

import '../../../core/init/locale/locale_manager.dart';

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