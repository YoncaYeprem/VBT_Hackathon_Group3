part of 'other_profile_page_cubit.dart';

@immutable
abstract class OtherProfilePageCubitState {}

class OtherProfilePageCubitInitial extends OtherProfilePageCubitState {}

class BookDownloadedState extends OtherProfilePageCubitState {
  final BookModel model;

  BookDownloadedState(this.model);
}
