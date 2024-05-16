// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_booing_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserBookingDTO _$GetUserBookingDTOFromJson(Map<String, dynamic> json) =>
    GetUserBookingDTO(
      response: (json['response'] as List<dynamic>)
          .map((e) => BookingApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetUserBookingDTOToJson(GetUserBookingDTO instance) =>
    <String, dynamic>{
      'response': instance.response,
    };
