import '../../../../feature/addBook/model/product_model.dart';
import 'book_box.dart';


abstract class LocalStorage {
  Future<void> addBook({required BookModel book});
  Future<BookModel?> getABook({required String id});
  Future<List<BookModel>> getAllBooks();
  Future<bool> deleteBook({required BookModel book});
  Future<BookModel> updateBook({required BookModel book});
}

class HiveLocalStorage extends LocalStorage {

  @override
  Future<void> addBook({required BookModel book}) async {
    await Boxes.getBookHive().put(book.id, book);
  }

  @override
  Future<bool> deleteBook({required BookModel book}) async {
    await book.delete();
    return true;
  }

  @override
  Future<List<BookModel>> getAllBooks() async {
    List<BookModel> allBooks = <BookModel>[];
    allBooks = Boxes.getBookHive().values.toList();

    if (allBooks.isNotEmpty) {
      allBooks.sort(
          (BookModel a, BookModel b) => b.createdAt.compareTo(a.createdAt));
    }
    return allBooks;
  }

  @override
  Future<BookModel?> getABook({required String id}) async {
    if (Boxes.getBookHive().containsKey(id)) {
      return Boxes.getBookHive().get(id);
    } else {
      return null;
    }
  }

  @override
  Future<BookModel> updateBook({required BookModel book}) async {
    await book.save();
    return book;
  }
}