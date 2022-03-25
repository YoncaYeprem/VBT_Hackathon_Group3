import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../addBook/book_model/productmodel.dart';
import '../../../../product/utils/firebase/firebase_storage_functions.dart';

import '../../../authentication/register/model/user_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.userId) : super(ProfileInitial()) {
    init();
  }
  final String? userId;

  List<BookModel>? listBookModel;
  UserModel? userModel;

  Future<void> getUserData() async {
    try {
      userModel = await FirebaseStorageFunctions().getUserModel(userId ?? "");

      if (userModel != null) {
        emit(UserDownloadedState(userModel: userModel));
      } else {
        emit(FailedState());
      }
    } catch (e) {
      emit(FailedState());
    }
  }

  void init() async {
    emit(GettingDataLoadingState());
    await getUserData();
    emit(UserDownloadedState(userModel: userModel));
  }
}
