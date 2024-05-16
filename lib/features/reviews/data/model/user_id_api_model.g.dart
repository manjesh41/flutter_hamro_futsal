// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_id_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserIdApiModel _$UserIdApiModelFromJson(Map<String, dynamic> json) =>
    UserIdApiModel(
      userId: json['_id'] as String?,
      userName: json['userName'] as String,
      fname: json['fname'] as String,
      email: json['email'] as String,
      phoneNum: json['phoneNum'] as String?,
      lname: json['lname'] as String?,
    );

Map<String, dynamic> _$UserIdApiModelToJson(UserIdApiModel instance) =>
    <String, dynamic>{
      '_id': instance.userId,
      'userName': instance.userName,
      'fname': instance.fname,
      'email': instance.email,
      'phoneNum': instance.phoneNum,
      'lname': instance.lname,
    };
