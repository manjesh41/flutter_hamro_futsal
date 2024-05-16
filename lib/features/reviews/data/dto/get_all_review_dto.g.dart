// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_review_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllReviewDTO _$GetAllReviewDTOFromJson(Map<String, dynamic> json) =>
    GetAllReviewDTO(
      data: (json['data'] as List<dynamic>)
          .map((e) => ReviewApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllReviewDTOToJson(GetAllReviewDTO instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
