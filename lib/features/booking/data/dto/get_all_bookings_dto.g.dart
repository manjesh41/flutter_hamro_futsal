// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_bookings_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllBookingDTO _$GetAllBookingDTOFromJson(Map<String, dynamic> json) =>
    GetAllBookingDTO(
      data: (json['data'] as List<dynamic>)
          .map((e) => BookingApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllBookingDTOToJson(GetAllBookingDTO instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
