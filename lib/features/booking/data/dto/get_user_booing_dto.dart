

import 'package:json_annotation/json_annotation.dart';

import '../model/booking_api_model.dart';

part 'get_user_booing_dto.g.dart';

@JsonSerializable()
class GetUserBookingDTO {
  final List<BookingApiModel> response;

  GetUserBookingDTO({
    required this.response,
  });

  factory GetUserBookingDTO.fromJson(Map<String, dynamic> json) =>
      _$GetUserBookingDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserBookingDTOToJson(this);
}
