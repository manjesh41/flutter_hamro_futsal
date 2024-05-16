// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllUserDTO _$GetAllUserDTOFromJson(Map<String, dynamic> json) =>
    GetAllUserDTO(
      data: (json['data'] as List<dynamic>)
          .map((e) => UserApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllUserDTOToJson(GetAllUserDTO instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
