import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../product/utils/hive/book/book_hive_functions.dart';
import '../../../addBook/model/book_model.dart';

part 'my_favorites_state.dart';

class MyFavoritesCubit extends Cubit<MyFavoritesState> {
  MyFavoritesCubit() : super(MyFavoritesInitial()) {
    _init();
  }


  LocalStorage localStorage = HiveLocalStorage();
  List<BookModel?> allFavoriteBooks = [];

  _init() async {
    allFavoriteBooks = await localStorage.getAllBooks();
    emit(MyfavoritesCompleted(allFavoriteBooks));
  }

  Future<void> removeFromFavorites(book) async {
    await localStorage.deleteBook(book: book);
    allFavoriteBooks.remove(book);
    emit(MyFavoritesRemoveItem(allFavoriteBooks));
  }
}
