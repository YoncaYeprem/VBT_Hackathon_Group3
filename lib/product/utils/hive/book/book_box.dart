import 'package:hive/hive.dart';

import '../../../../feature/addBook/book_model/productmodel.dart';



class Boxes {
  static Box<BookModel> getBookHive() => Hive.box<BookModel>('books');
}