part of 'homeview_cubit.dart';

@immutable
abstract class HomeviewState {}

class HomeviewInitial extends HomeviewState {}

class HomeViewComplited extends HomeviewState {
  List<BookModel>? bookModel;
  UserModel? userModel;
  HomeViewComplited({
    this.bookModel,
    this.userModel,
  });
}

class HomeViewLoading extends HomeviewState {}

class HomeViewFailed extends HomeviewState {}
