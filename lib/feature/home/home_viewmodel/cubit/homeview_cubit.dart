import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../authentication/register/model/user_model.dart';
import '../../../addBook/book_model/productmodel.dart';
import '../../../../product/utils/firebase/firebase_storage_functions.dart';

part 'homeview_state.dart';

class HomeviewCubit extends Cubit<HomeviewState> {
  List<BookModel>? bookModel;
  UserModel? userModel;
  late TabController takipkontrol;
  bool isLoading = false;
  HomeviewCubit() : super(HomeviewInitial()) {
    init();
  }

  void changeLoading() {
    isLoading = !isLoading;
  }

  Future<void> getUserData() async {
    changeLoading();
    userModel = await FirebaseStorageFunctions().getUserModel();
    changeLoading();
  }

  Future init() async {
    await getUserData();
    emit(HomeViewComplited(
      userModel: userModel,
    ));
  }
}
