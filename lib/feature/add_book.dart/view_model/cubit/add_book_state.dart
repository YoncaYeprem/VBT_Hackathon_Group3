part of 'add_book_cubit.dart';

@immutable
abstract class AddBookState {}

class AddBookInitial extends AddBookState {}

class IsExchange extends AddBookState {
  IsExchange();
}

class AddBookonChange extends AddBookState {
  AddBookonChange();
}

class SelectImage extends AddBookState {
  SelectImage();
}

class AddBookComplete extends AddBookState {
  AddBookComplete();
}
