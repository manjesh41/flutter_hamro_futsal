import 'package:json_annotation/json_annotation.dart';

import '../model/booking_api_model.dart';

part 'get_all_bookings_dto.g.dart';

@JsonSerializable()
class GetAllBookingDTO {
  
  final List<BookingApiModel> data;

  GetAllBookingDTO({

    required this.data,
  });

  factory GetAllBookingDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllBookingDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllBookingDTOToJson(this);
}
