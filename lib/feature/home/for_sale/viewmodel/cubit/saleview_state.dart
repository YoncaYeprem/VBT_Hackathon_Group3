part of 'saleview_cubit.dart';

@immutable
abstract class SaleviewState {}

class SaleviewInitial extends SaleviewState {}

class SaleViewComplited extends SaleviewState {
  List<BookModel>? bookModel;
  SaleViewComplited({
    this.bookModel,
  });
}

class SaleViewFailed extends SaleviewState {}

class SaleViewLoading extends SaleviewState {}
