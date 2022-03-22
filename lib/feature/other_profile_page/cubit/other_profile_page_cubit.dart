import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:vbt_hackathon_group3/feature/authentication/register/model/user_model.dart';
import 'package:vbt_hackathon_group3/product/productmodel.dart';
import 'package:vbt_hackathon_group3/product/utils/firebase/firebase_storage_functions.dart';

part 'other_profile_page_cubit_state.dart';

class OtherProfilePageCubit extends Cubit<OtherProfilePageCubitState> {
  OtherProfilePageCubit() : super(OtherProfilePageCubitInitial()) {
    init();
  }
  List<BookModel>? listBookModel;
  UserModel? user;
  Future<void> getUserData() async {
    try {
      // user = await FirebaseStorageFunctions().getUserModel(user?.id ?? "");
      user = await FirebaseStorageFunctions().getUserModel(user?.id);

      print(user?.id);
      if (user != null) {
        emit(UserDownloadedState(user!));
      } else {
        emit(FailedState());
      }
    } catch (e) {
      emit(FailedState());
    }
  }

  Future<void> getAllBookData(String? ownedBookUID) async {
    listBookModel = await FirebaseStorageFunctions()
        .getBookModels(ownedUID: ownedBookUID ?? "");
    if (listBookModel != null) {
      listBookModel?.removeWhere((element) => element.ownerUID != ownedBookUID);
      inspect(listBookModel);
    }

    emit(BookDownloadedState(listBookModel ?? []));
  }

  void init() {
    emit(GettingDataLoadingState());
    getUserData();
    getAllBookData(user?.id);
  }
}
