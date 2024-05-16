import 'package:json_annotation/json_annotation.dart';

import '../model/review_api_model.dart';

part 'get_all_review_dto.g.dart';

@JsonSerializable()
class GetAllReviewDTO {
  final List<ReviewApiModel> data;

  GetAllReviewDTO({
    required this.data,
  });

  factory GetAllReviewDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllReviewDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllReviewDTOToJson(this);
}
