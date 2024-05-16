import 'package:json_annotation/json_annotation.dart';

import '../model/profile_api_model.dart';

part 'get_user_info_dto.g.dart';

@JsonSerializable()
class GetUserInfoDTO {
  final List<ProfileApiModel> data;

  GetUserInfoDTO({
    required this.data,
  });

  factory GetUserInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$GetUserInfoDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserInfoDTOToJson(this);
}

