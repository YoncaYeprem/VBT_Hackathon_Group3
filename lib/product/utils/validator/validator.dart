class Validator {
  String? validateStrings({required String? value}) {
    if (value == null) {
      return null;
    }
    if (value.isEmpty) {
      return 'This Field Can Not Be Empty';
    }
    return null;
  }

  String? validateEmail({required String? email}) {
    if (email == null) {
      return null;
    }
    RegExp emailReq = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (email.isEmpty) {
      return 'Email Can Not Be Empty';
    } else if (!emailReq.hasMatch(email)) {
      return 'correct email needed';
    }
    return null;
  }

  String? validatePassword({required String? password}) {
    if (password == null) {
      return null;
    }
    if (password.isEmpty) {
      return 'Password Can Not Be Empty';
    } else if (password.length < 6) {
      return 'enter at least 7 words';
    }
    return null;
  }

  String? checkRepeatPass({required String? password, required String? repeat}) {
    if (repeat == null) {
      return null;
    }
    if (repeat.isEmpty) {
      return 'Repeat Password Can Not Be Empty';
    } else if (password != repeat) {
      return 'Passwords Not Match';
    }else if(password == repeat) {
      return null;
    }
    return null;
  }
}