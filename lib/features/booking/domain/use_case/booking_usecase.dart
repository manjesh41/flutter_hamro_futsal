import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../entity/booking_entiry.dart';
import '../repository/booking_repositary.dart';

final bookingUsecaseProvider = Provider<BookingUseCase>(
  (ref) => BookingUseCase(
    bookingRepository: ref.watch(bookingRepositoryProvider),
  ),
);

class BookingUseCase {
  final IBookingRepository bookingRepository;

  BookingUseCase({required this.bookingRepository});

  Future<Either<Failure, List<BookingEntity>>> getAllBookings() {
    return bookingRepository.getAllBookings();
  }

  Future<Either<Failure, List<BookingEntity>>> getUserBookings() {
    return bookingRepository.getUserBookings();
  }

  Future<Either<Failure, bool>> addBooking(BookingEntity booking) {
    return bookingRepository.addBooking(booking);
  }

  Future<Either<Failure, bool>> deleteBooking(String id) {
    return bookingRepository.deleteBooking(id);
  }
}
