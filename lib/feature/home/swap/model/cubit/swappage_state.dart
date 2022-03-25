part of 'swappage_cubit.dart';

@immutable
abstract class SwapPageState {}

class SwapPageInitial extends SwapPageState {}

class SwapBookComplited extends SwapPageState {
  List<BookModel>? bookModel;
  SwapBookComplited({
    this.bookModel,
  });
}

class SwapBookFailed extends SwapPageState {}

class SwapHomeLoading extends SwapPageState {}
