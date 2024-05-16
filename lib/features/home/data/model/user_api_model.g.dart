// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserApiModel _$UserApiModelFromJson(Map<String, dynamic> json) => UserApiModel(
      id: json['_id'] as String?,
      email: json['email'] as String,
      fname: json['fname'] as String,
      lname: json['lname'] as String,
      phoneNum: json['phoneNum'] as String,
      userName: json['userName'] as String,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UserApiModelToJson(UserApiModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'fname': instance.fname,
      'lname': instance.lname,
      'userName': instance.userName,
      'email': instance.email,
      'phoneNum': instance.phoneNum,
      'password': instance.password,
    };
