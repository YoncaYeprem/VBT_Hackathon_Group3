part of 'my_favorites_cubit.dart';

@immutable
abstract class MyFavoritesState {}

class MyFavoritesInitial extends MyFavoritesState {}

class MyfavoritesCompleted extends MyFavoritesState{
  final List<BookModel?>? allFavorites;
  MyfavoritesCompleted(this.allFavorites);
}

class MyFavoritesRemoveItem extends MyFavoritesState {
  final List<BookModel?>? allFavorites;
  MyFavoritesRemoveItem(this.allFavorites);
}