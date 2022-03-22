import 'package:hive/hive.dart';

import '../../../../feature/addBook/model/product_model.dart';


class Boxes {
  static Box<BookModel> getBookHive() => Hive.box<BookModel>('books');
}