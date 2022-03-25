import '../../../../feature/addBook/book_model/productmodel.dart';
import 'book_box.dart';


abstract class LocalStorage {
  Future<void> addBook({required BookModel book});
  Future<BookModel?> getABook({required String id});
  Future<List<BookModel>> getAllBooks();
  Future deleteBook({required BookModel book});
}

class HiveLocalStorage extends LocalStorage {

  @override
  Future<void> addBook({required BookModel book}) async {
    await Boxes.getBookHive().put(book.id, book);
  }

  @override
  Future<BookModel?> getABook({required String id}) async {
    if (Boxes.getBookHive().containsKey(id)) {
      return await Boxes.getBookHive().get(id);
    } else {
      return null;
    }
  }

  @override
  Future deleteBook({required BookModel book}) async {
   
  final box = Boxes.getBookHive();
  await box.delete(book.id);
  return true;
 
  }

  @override
  Future<List<BookModel>> getAllBooks() async {
    List<BookModel> allBooks = <BookModel>[];
    allBooks = Boxes.getBookHive().values.toList();
    return allBooks;
  }
}