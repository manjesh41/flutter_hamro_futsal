import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harmo_futsal/config/constants/hive_table_constrant.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entity/booking_entiry.dart';
import 'booking_api_model.dart';

part 'booking_hive_model.g.dart';

final bookingHiveModelProvider = Provider(
  (ref) => const BookingHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.bookingTableId)
class BookingHiveModel {
  @HiveField(0)
  final String? bookingId;
  @HiveField(1)
  final String? fullname;
  @HiveField(2)
  final String? email;
  @HiveField(3)
  final String? phoneNum;
  @HiveField(4)
  final String? bookingDate;
  @HiveField(5)
  final String? startTime;
  @HiveField(6)
  final String? endTime;
  @HiveField(7)
  final String? status;

  // empty constructor
  const BookingHiveModel.empty()
      : bookingId = '',
        fullname = '',
        email = '',
        phoneNum = '',
        bookingDate = null,
        startTime = '',
        endTime = '',
        status = '';

  BookingHiveModel({
    required this.bookingId,
    required this.fullname,
    required this.email,
    required this.phoneNum,
    required this.bookingDate,
    required this.startTime,
    required this.endTime,
    required this.status,
  });

  // Convert Hive Object to Entity
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

  // Convert Entity to Hive Object
  BookingHiveModel toHiveModel(BookingEntity entity) => BookingHiveModel(
        bookingId: bookingId ?? '',
        fullname: fullname,
        email: email,
        phoneNum: phoneNum,
        bookingDate: bookingDate,
        startTime: startTime,
        endTime: endTime,
        status: status,
      );

  List<BookingHiveModel> fromApiModelList(List<BookingApiModel> apiModels) {
    return apiModels
        .map((apiModel) => BookingHiveModel(
              bookingId: apiModel.bookingId,
              fullname: apiModel.fullname,
              email: apiModel.email,
              phoneNum: apiModel.phoneNum,
              bookingDate: apiModel.bookingDate,
              startTime: apiModel.startTime,
              endTime: apiModel.endTime,
              status: apiModel.status,
            ))
        .toList();
  }

  // Convert Hive List to Entity List
  List<BookingEntity> toEntityList(List<BookingHiveModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  String toString() {
    return 'BookingHiveModel(bookingId: $bookingId, fullname: $fullname, email: $email, phoneNum: $phoneNum, bookingDate: $bookingDate, startTime: $startTime, endTime: $endTime, status: $status)';
  }
}
