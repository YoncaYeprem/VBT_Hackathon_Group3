// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) => BookModel(
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
    )..owenerUID = json['owenerUID'] as String?;

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
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
      'owenerUID': instance.owenerUID,
    };
