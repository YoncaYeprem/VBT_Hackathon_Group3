import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
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
      user = await FirebaseStorageFunctions()
          .getUserModel("UI6gjx43h6gYEigYKNphCOWn8tH2");

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

  Future<void> getAllBookData() async {
    BookModel? temp;
    if (user?.myBooks?.length != null || user?.myBooks?.length == 0) {
      for (int i = 0; i < user!.myBooks!.length; i++) {
        temp = await FirebaseStorageFunctions()
            .getBookModels(user?.myBooks?[i] ?? "");
        if (temp != null) {
          listBookModel?.add(temp);
        }
      }
    }
    emit(BookDownloadedState(listBookModel ?? []));
  }

  void init() {
    emit(GettingDataLoadingState());
    getUserData();
    getAllBookData();
  }
}
