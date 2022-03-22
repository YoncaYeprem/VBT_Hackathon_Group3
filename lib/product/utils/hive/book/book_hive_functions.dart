import '../../../../feature/addBook/model/product_model.dart';
import 'book_box.dart';


abstract class LocalStorage {
  Future<void> addTask({required BookModel book});
  Future<BookModel?> getTask({required String id});
  Future<List<BookModel>> getAllTasks();
  Future<bool> deleteTask({required BookModel book});
  Future<BookModel> updateTask({required BookModel book});
}

class HiveLocalStorage extends LocalStorage {

  @override
  Future<void> addTask({required BookModel book}) async {
    await Boxes.getBookHive().put(book.id, book);
  }

  @override
  Future<bool> deleteTask({required BookModel book}) async {
    await book.delete();
    return true;
  }

  @override
  Future<List<BookModel>> getAllTasks() async {
    List<BookModel> allBooks = <BookModel>[];
    allBooks = Boxes.getBookHive().values.toList();

    if (allBooks.isNotEmpty) {
      allBooks.sort(
          (BookModel a, BookModel b) => b.createdAt.compareTo(a.createdAt));
    }
    return allBooks;
  }

  @override
  Future<BookModel?> getTask({required String id}) async {
    if (Boxes.getBookHive().containsKey(id)) {
      return Boxes.getBookHive().get(id);
    } else {
      return null;
    }
  }

  @override
  Future<BookModel> updateTask({required BookModel book}) async {
    await book.save();
    return book;
  }
}