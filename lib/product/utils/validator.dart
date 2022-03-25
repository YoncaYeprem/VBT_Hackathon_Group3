import 'package:easy_localization/easy_localization.dart';

import '../../core/init/lang/locale_keys.g.dart';

class Validator {
  String? validateMailForm(String? value) {
    RegExp emailReq = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value == null) {
      return null;
    } else if (value.isEmpty) {
      return LocaleKeys.validator_cantEmpty.tr();
    } else if (!emailReq.hasMatch(value)) {
      return LocaleKeys.validator_enterValidValue.tr();
    }
    return null;
  }

  String? validatePasswordForm(String? val) {
    if (val == null) {
      return null;
    } else if (val.isEmpty) {
      return LocaleKeys.validator_cantEmpty.tr();
    }
    return null;
  }
}
