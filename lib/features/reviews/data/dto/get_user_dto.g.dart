// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserIdDTO _$GetUserIdDTOFromJson(Map<String, dynamic> json) => GetUserIdDTO(
      data: (json['data'] as List<dynamic>)
          .map((e) => UserIdApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetUserIdDTOToJson(GetUserIdDTO instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
