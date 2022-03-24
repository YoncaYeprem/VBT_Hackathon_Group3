import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/init/locale/locale_manager.dart';
import '../../../../product/utils/cache/cache_manager.dart';
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
    userModel = await FirebaseStorageFunctions().getUserModel(CacheManager.getStringData(PreferencesKey.token) ?? "");

    changeLoading();
  }

  Future<void> getBookData() async {
    changeLoading();
    bookModel = await FirebaseStorageFunctions().getBookModelsExchange();

    changeLoading();
  }

  Future init() async {
    await getUserData();
    await getBookData();
    emit(HomeViewComplited(
      userModel: userModel,
      bookModel: bookModel,
    ));
  }
}
