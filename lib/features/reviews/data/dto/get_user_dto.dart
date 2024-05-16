import 'package:json_annotation/json_annotation.dart';

import '../model/user_id_api_model.dart';

part 'get_user_dto.g.dart';

@JsonSerializable()
class GetUserIdDTO {
  final List<UserIdApiModel> data;

  GetUserIdDTO({
    required this.data,
  });

  factory GetUserIdDTO.fromJson(Map<String, dynamic> json) =>
      _$GetUserIdDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserIdDTOToJson(this);
}
