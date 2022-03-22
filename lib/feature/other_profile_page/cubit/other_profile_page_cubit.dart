import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:vbt_hackathon_group3/feature/authentication/register/model/user_model.dart';
import 'package:vbt_hackathon_group3/product/productmodel.dart';

part 'other_profile_page_cubit_state.dart';

class OtherProfilePageCubit extends Cubit<OtherProfilePageCubitState> {
  OtherProfilePageCubit() : super(OtherProfilePageCubitInitial()) {
    getOwnedBookData();
  }
  BookModel? model;
  User? user;
  Future<void> getOwnedBookData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference user = firestore.collection("users");
    final temp = await user.doc("UI6gjx43h6gYEigYKNphCOWn8tH2").get();
    if (temp.exists) {
      Map<String, dynamic> data = temp.data() as Map<String, dynamic>;
      //TODO: data yı usermodel e parse'la
      //TODO: usermodelin içindeki mybooksun her bir item ı için yukarıdaki fonksiyonları kullan ve yolla

    } else {
      print("temp not exist");
    }

    // user.doc("UI6gjx43h6gYEigYKNphCOWn8tH2");
    // inspect(user.doc("UI6gjx43h6gYEigYKNphCOWn8tH2").get());
    // inspect(user);
  }
}
