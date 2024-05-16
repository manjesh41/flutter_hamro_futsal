// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingApiModel _$BookingApiModelFromJson(Map<String, dynamic> json) =>
    BookingApiModel(
      bookingId: json['id'] as String?,
      fullname: json['fullname'] as String?,
      email: json['email'] as String?,
      phoneNum: json['phoneNum'] as String?,
      bookingDate: json['bookingDate'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$BookingApiModelToJson(BookingApiModel instance) =>
    <String, dynamic>{
      'id': instance.bookingId,
      'fullname': instance.fullname,
      'email': instance.email,
      'phoneNum': instance.phoneNum,
      'bookingDate': instance.bookingDate,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'status': instance.status,
    };
