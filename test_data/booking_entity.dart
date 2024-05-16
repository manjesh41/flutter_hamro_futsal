import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:harmo_futsal/features/booking/domain/entity/booking_entiry.dart';

Future<List<BookingEntity>> getUserBooking() async {
  final response = await rootBundle.loadString('test_data/data.json');
  final jsonList = await json.decode(response);

  final List<BookingEntity> BookingList = jsonList
      .map<BookingEntity>(
        (json) => BookingEntity.fromJson(json),
      )
      .toList();

  print(BookingList);
  return Future.value(BookingList);
}

Future<List<BookingEntity>> getAllBooking() async {
  final response =
      await rootBundle.loadString('test_data/get_all_bookings_test.json');
  final jsonList = await json.decode(response);

  final List<BookingEntity> AllBookingList = jsonList
      .map<BookingEntity>(
        (json) => BookingEntity.fromJson(json),
      )
      .toList();

  print(AllBookingList);
  return Future.value(AllBookingList);
}
