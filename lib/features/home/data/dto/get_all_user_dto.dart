import 'package:json_annotation/json_annotation.dart';


import '../model/user_api_model.dart';

part 'get_all_user_dto.g.dart';

@JsonSerializable()
class GetAllUserDTO {
 
  final List<UserApiModel> data;

  GetAllUserDTO({

    required this.data,
  });

  factory GetAllUserDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllUserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllUserDTOToJson(this);
}
