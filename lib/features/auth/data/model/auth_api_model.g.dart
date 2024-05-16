// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Users _$UsersFromJson(Map<String, dynamic> json) => Users(
      fname: json['fname'] as String?,
      lname: json['lname'] as String?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      phoneNum: json['phoneNum'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'fname': instance.fname,
      'lname': instance.lname,
      'userName': instance.userName,
      'email': instance.email,
      'phoneNum': instance.phoneNum,
      'password': instance.password,
    };
