import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harmo_futsal/features/booking/data/repository/booking_remote_repo_impl.dart';

import '../../../../core/failure/failure.dart';
import '../entity/booking_entiry.dart';

final bookingRepositoryProvider = Provider<IBookingRepository>(
  // // Check for the internet
  (ref) {
    // return ref.watch(standingLocalRepoProvider);
    // // Check for the internet
    return ref.watch(bookingRemoteRepoProvider);
  },
);

abstract class IBookingRepository {
  Future<Either<Failure, List<BookingEntity>>> getAllBookings();
  Future<Either<Failure, List<BookingEntity>>> getUserBookings();
  Future<Either<Failure, bool>> addBooking(BookingEntity booking);
  Future<Either<Failure, bool>> deleteBooking(String id);
}
