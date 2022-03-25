import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vbt_hackathon_group3/core/init/locale/locale_manager.dart';
import 'package:vbt_hackathon_group3/feature/addBook/book_model/productmodel.dart';
import 'package:vbt_hackathon_group3/product/utils/firebase/firebase_storage_functions.dart';

import '../../../../product/utils/cache/cache_manager.dart';

part 'mybookpage_state.dart';

class MybookpageCubit extends Cubit<MybookpageState> {
  List<BookModel>? bookModel;
  bool isLoading = false;

  MybookpageCubit() : super(MybookpageInitial()) {
    init();
  }

  void changeLoading() {
    isLoading = !isLoading;
  }

  Future<void> getBookData() async {
    changeLoading();
    bookModel = await FirebaseStorageFunctions().getBookModels(ownedUID: CacheManager.getStringData(PreferencesKey.token) ?? "");
    if (bookModel != null) {
      bookModel?.removeWhere((element) => element.userId != CacheManager.getStringData(PreferencesKey.token));
      inspect(bookModel);
    }
    changeLoading();
  }

  Future init() async {
    await getBookData();
    emit(MyBookPageCompleted(bookModel: bookModel));
  }
}
