part of 'mybookpage_cubit.dart';

@immutable
abstract class MybookpageState {}

class MybookpageInitial extends MybookpageState {}

class MyBookPageCompleted extends MybookpageState {
  List<BookModel>? bookModel;
  MyBookPageCompleted({
    this.bookModel,
  });
}

class MyBookLoading extends MybookpageState {}

class MyBookFailed extends MybookpageState {}
