import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../product/utils/hive/book/book_hive_functions.dart';
import '../../../addBook/book_model/productmodel.dart';

part 'book_detail_state.dart';

class BookDetailCubit extends Cubit<BookDetailState> {
  BookDetailCubit(this.book) : super(BookDetailInitial()) {
    checkIsSaved();
  }

  BookModel book;
  bool isSaved = false;
  LocalStorage localStorage = HiveLocalStorage();

  checkIsSaved() async {
    if (await localStorage.getABook(id: book.id!) == null) {
      isSaved = false;
    } else {
      isSaved = true;
    }

    emit(BookDetailSavedInfo());
  }

  changeSaved() {
    isSaved = !isSaved;
    emit(BookDetailSave());
  }

  addOrDeleteFromFavorites() async {
    changeSaved();
    if (await localStorage.getABook(id: book.id!) == null) {
      await localStorage.addBook(book: book);

      emit(BookDetailDeleted());
    } else {
      await localStorage.deleteBook(book: book);
      emit(BookDetailAdded());
    }
  }
}
