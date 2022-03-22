import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';
@JsonSerializable()
class UserModel{
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? userName;
  final String? email;
  final String? password;
  final String? photo;
  UserModel({this.id,this.firstName, this.lastName, this.userName, this.email, this.password, this.photo});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
  
}