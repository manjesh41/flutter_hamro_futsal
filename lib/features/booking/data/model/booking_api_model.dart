import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/booking_entiry.dart';

part 'booking_api_model.g.dart';

final bookingApiModelProvider = Provider<BookingApiModel>(
  (ref) => const BookingApiModel.empty(),
);

@JsonSerializable()
class BookingApiModel extends Equatable {
  @JsonKey(name: 'id')
  final String? bookingId;
  final String? fullname;
  final String? email;
  final String? phoneNum;
  final String? bookingDate;
  final String? startTime;
  final String? endTime;
  final String? status;

  const BookingApiModel({
    required this.bookingId,
    required this.fullname,
    required this.email,
    required this.phoneNum,
    required this.bookingDate,
    required this.startTime,
    required this.endTime,
    required this.status,
  });
  const BookingApiModel.empty()
      : bookingId = '',
        fullname = '',
        email = '',
        phoneNum = '',
        bookingDate = null,
        startTime = '',
        endTime = '',
        status = '';

  // Convert API Object to Entity
  BookingEntity toEntity() => BookingEntity(
        bookingId: bookingId ?? '',
        fullname: fullname,
        email: email,
        phoneNum: phoneNum,
        bookingDate: bookingDate,
        startTime: startTime,
        endTime: endTime,
        status: status,
      );

  // Convert Entity to API Object
  BookingApiModel fromEntity(BookingEntity entity) => BookingApiModel(
        bookingId: bookingId ?? '',
        fullname: fullname,
        email: email,
        phoneNum: phoneNum,
        bookingDate: bookingDate,
        startTime: startTime,
        endTime: endTime,
        status: status,
      );

  // Convert API List to Entity List
  List<BookingEntity> toEntityList(List<BookingApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props => [
        bookingId,
        fullname,
        email,
        phoneNum,
        bookingDate,
        startTime,
        endTime,
        status
      ];

  factory BookingApiModel.fromJson(Map<String, dynamic> json) =>
      _$BookingApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingApiModelToJson(this);
}
