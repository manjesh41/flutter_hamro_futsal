// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewApiModel _$ReviewApiModelFromJson(Map<String, dynamic> json) =>
    ReviewApiModel(
      reviewid: json['id'] as String?,
      text: json['text'] as String?,
      v: json['__v'] as int?,
      user: json['user'] == null
          ? null
          : UserApiModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReviewApiModelToJson(ReviewApiModel instance) =>
    <String, dynamic>{
      'id': instance.reviewid,
      'text': instance.text,
      '__v': instance.v,
      'user': instance.user,
    };

UserApiModel _$UserApiModelFromJson(Map<String, dynamic> json) => UserApiModel(
      id: json['_id'] as String,
      fname: json['fname'] as String,
      lname: json['lname'] as String,
      userName: json['userName'] as String,
      email: json['email'] as String,
      phoneNum: json['phoneNum'] as String,
      password: json['password'] as String,
      role: json['role'] as String,
      v: json['__v'] as int,
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
      'role': instance.role,
      '__v': instance.v,
    };
