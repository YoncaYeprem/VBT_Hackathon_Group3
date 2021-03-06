import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../product/utils/firebase/firebase_storage_functions.dart';
import '../../addBook/book_model/productmodel.dart';
import '../../authentication/register/model/user_model.dart';

part 'other_profile_page_cubit_state.dart';

class OtherProfilePageCubit extends Cubit<OtherProfilePageCubitState> {
  OtherProfilePageCubit(this.userId) : super(OtherProfilePageCubitInitial()) {
    init();
  }
  List<BookModel>? listBookModel;
  String userId;
  UserModel? user;

  Future<void> getUserData() async {
    try {
      user = await FirebaseStorageFunctions().getUserModel(userId);
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
        .getBookModels(ownedUID: user?.id ?? "");
    if (listBookModel != null) {
      listBookModel?.removeWhere((element) => element.userId != user?.id);
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
