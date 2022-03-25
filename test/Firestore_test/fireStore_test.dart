import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vbt_hackathon_group3/firebase_options.dart';
import 'package:vbt_hackathon_group3/product/utils/firebase/firebase_storage_functions.dart';

void main() {
  test('Sample Test', () async {
    WidgetsFlutterBinding.ensureInitialized();

    FirebaseApp app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // final data =
    // //     await FirebaseStorageFunctions().getBookModels("xX9mWLq4SQgh43oIGah6");
    // inspect(data);
    // expect(data, isNotNull);
  });
}
