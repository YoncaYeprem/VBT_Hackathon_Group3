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
    print("init kısmında");
    if (await localStorage.getABook(id: book.id!) == null) {
      isSaved = false;
    } else {
      isSaved = true;
    }
    print(isSaved.toString());
    emit(BookDetailSavedInfo());
  }

changeSaved(){
  isSaved = !isSaved;
  emit(BookDetailSave());
}
  addOrDeleteFromFavorites() async {
    changeSaved();
    print("From clicked " + isSaved.toString());
    if (await localStorage.getABook(id: book.id!) == null) {
      print("Ekleme kısmında");
      await localStorage.addBook(book: book);
      
      emit(BookDetailDeleted());
      print("added to hive");
    } else {
      print("Silme kısmında");
      await localStorage.deleteBook(book: book);
      print("deleted from hive");
      emit(BookDetailAdded());
    }
  }

  
}
