part of 'book_detail_cubit.dart';

@immutable
abstract class BookDetailState {}

class BookDetailInitial extends BookDetailState {}
class BookDetailSavedInfo extends BookDetailState {}
class BookDetailSave extends BookDetailState {}

class BookDetailAdded extends BookDetailState {}
class BookDetailDeleted extends BookDetailState {}