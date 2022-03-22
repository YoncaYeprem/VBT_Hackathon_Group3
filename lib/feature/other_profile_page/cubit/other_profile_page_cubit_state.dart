part of 'other_profile_page_cubit.dart';

@immutable
abstract class OtherProfilePageCubitState {}

class OtherProfilePageCubitInitial extends OtherProfilePageCubitState {}

class BookDownloadedState extends OtherProfilePageCubitState {
  final List<BookModel> model;

  BookDownloadedState(this.model);
}

class UserDownloadedState extends OtherProfilePageCubitState {
  final UserModel model;

  UserDownloadedState(this.model);
}

class FailedState extends OtherProfilePageCubitState {
  void showMessage(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Failed")));
  }
}

class GettingDataLoadingState extends OtherProfilePageCubitState {}
