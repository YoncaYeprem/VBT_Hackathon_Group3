import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../product/utils/hive/book/book_hive_functions.dart';
import '../../../addBook/model/product_model.dart';

part 'book_detail_state.dart';

class BookDetailCubit extends Cubit<BookDetailState> {
  BookDetailCubit(this.book) : super(BookDetailInitial());

  bool isSaved = false;
  BookModel book;
  LocalStorage localStorage = HiveLocalStorage();

  void changeSave() {
    isSaved = !isSaved;
    emit(BookDetailChangeSave());
  }

   addOrDeleteFromFavorites() async{
    if (isSaved == false) {
      await localStorage.addBook(book: book);
    } else {
      await localStorage.deleteBook(book: book);
    }
  }
}
