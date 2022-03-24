// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookModelAdapter extends TypeAdapter<BookModel> {
  @override
  final int typeId = 0;

  @override
  BookModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookModel(
      id: fields[0] as String?,
      userId: fields[1] as String?,
      bookName: fields[2] as String?,
      overview: fields[3] as String?,
      author: fields[4] as String?,
      exchange: fields[5] as bool?,
      publishYear: fields[6] as String?,
      publisher: fields[7] as String?,
      pageCount: fields[8] as int?,
      category: fields[9] as String?,
      photo: fields[10] as String?,
      language: fields[11] as String?,
      price: fields[12] as double?,
      createdAt: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BookModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.bookName)
      ..writeByte(3)
      ..write(obj.overview)
      ..writeByte(4)
      ..write(obj.author)
      ..writeByte(5)
      ..write(obj.exchange)
      ..writeByte(6)
      ..write(obj.publishYear)
      ..writeByte(7)
      ..write(obj.publisher)
      ..writeByte(8)
      ..write(obj.pageCount)
      ..writeByte(9)
      ..write(obj.category)
      ..writeByte(10)
      ..write(obj.photo)
      ..writeByte(11)
      ..write(obj.language)
      ..writeByte(12)
      ..write(obj.price)
      ..writeByte(13)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) => BookModel(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      bookName: json['bookName'] as String?,
      overview: json['overview'] as String?,
      author: json['author'] as String?,
      exchange: json['exchange'] as bool?,
      publishYear: json['publishYear'] as String?,
      publisher: json['publisher'] as String?,
      pageCount: json['pageCount'] as int?,
      category: json['category'] as String?,
      photo: json['photo'] as String?,
      language: json['language'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'bookName': instance.bookName,
      'overview': instance.overview,
      'author': instance.author,
      'exchange': instance.exchange,
      'publishYear': instance.publishYear,
      'publisher': instance.publisher,
      'pageCount': instance.pageCount,
      'category': instance.category,
      'photo': instance.photo,
      'language': instance.language,
      'price': instance.price,
      'createdAt': instance.createdAt,
    };
