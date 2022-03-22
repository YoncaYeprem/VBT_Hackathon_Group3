// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String?,
      firstname: json['firstname'] as String?,
      lastName: json['lastName'] as String?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      myBooks:
          (json['myBooks'] as List<dynamic>?)?.map((e) => e as String).toList(),
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastName': instance.lastName,
      'userName': instance.userName,
      'myBooks': instance.myBooks,
      'email': instance.email,
      'password': instance.password,
      'photo': instance.photo,
    };
