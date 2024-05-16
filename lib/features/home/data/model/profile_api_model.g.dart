// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileApiModel _$ProfileApiModelFromJson(Map<String, dynamic> json) =>
    ProfileApiModel(
      userId: json['_id'] as String?,
      userName: json['userName'] as String,
      fname: json['fname'] as String,
      email: json['email'] as String,
      phoneNum: json['phoneNum'] as String?,
      lname: json['lname'] as String?,
    );

Map<String, dynamic> _$ProfileApiModelToJson(ProfileApiModel instance) =>
    <String, dynamic>{
      '_id': instance.userId,
      'userName': instance.userName,
      'fname': instance.fname,
      'email': instance.email,
      'phoneNum': instance.phoneNum,
      'lname': instance.lname,
    };
