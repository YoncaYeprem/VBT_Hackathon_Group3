import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class Authentication {
  Future<User?> eMailSignIn(
      {required String eMail,
      required String password,
      BuildContext? context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: eMail, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        if (context != null) {
          _sendSnacMessage(context, LocaleKeys.firebase_noUserFound.tr());
        }
      }
    }
    return user;
  }

  Future signUp(String email, String password, BuildContext context) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        _sendSnacMessage(context, LocaleKeys.firebase_verifyMailMessage.tr());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        _sendSnacMessage(context, LocaleKeys.firebase_mailAlreadyUsing.tr());
      }
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      log("exception code: (SignOut Exception) ${e.code}");
    }
  }

  Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  void _sendSnacMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
