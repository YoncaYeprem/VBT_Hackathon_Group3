import 'package:json_annotation/json_annotation.dart';
part 'book_model.g.dart';

@JsonSerializable()
class BookModel {
  BookModel(
      {this.id,
      this.userId,
      this.bookName,
      this.overview,
      this.author,
      this.exchange,
      this.publishYear,
      this.publisher,
      this.pageCount,
      this.category,
      this.photo,
      this.language,
      this.price,
      this.createDate});

  String? id;
  String? userId;
  String? bookName;
  String? overview;
  String? author;
  bool? exchange;
  String? publishYear;
  String? publisher;
  int? pageCount;
  String? category;
  String? photo;
  String? language;
  double? price;
  String? createDate;

  BookModel fromJson(Map<String, dynamic> json) {
    return _$BookModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BookModelToJson(this);
  }
}
