import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'productmodel.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class BookModel extends HiveObject {
  BookModel({
    this.id,
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
    // this.createdAt,
  });
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? userId;
  @HiveField(2)
  String? bookName;
  @HiveField(3)
  String? overview;
  @HiveField(4)
  String? author;
  @HiveField(5)
  bool? exchange;
  @HiveField(6)
  String? publishYear;
  @HiveField(7)
  String? publisher;
  @HiveField(8)
  int? pageCount;
  @HiveField(9)
  String? category;
  @HiveField(10)
  String? photo;
  @HiveField(11)
  String? language;
  @HiveField(12)
  double? price;
  // @HiveField(13)
  // DateTime? createdAt;

  @override
  factory BookModel.fromJson(Map<String, dynamic> json) {
    return _$BookModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$BookModelToJson(this);
  }

  factory BookModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return _$BookModelFromJson(data);
  }
}
