import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harmo_futsal/features/booking/domain/repository/booking_repositary.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entity/booking_entiry.dart';
import '../data_source/booking_local_datasource.dart';

final bookingLocalRepoProvider = Provider<IBookingRepository>(
  (ref) => BookingLocalRepositoryImpl(
    bookingLocalDataSource: ref.read(bookingLocalDataSourceProvider),
  ),
);

class BookingLocalRepositoryImpl implements IBookingRepository {
  final BookingLocalDataSource bookingLocalDataSource;

  BookingLocalRepositoryImpl({
    required this.bookingLocalDataSource,
  });

  @override
  Future<Either<Failure, bool>> deleteBooking(String id) {
    // TODO: implement deleteBooking
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BookingEntity>>> getAllBookings() {
    // TODO: implement getAllBookings
    return bookingLocalDataSource.getAllBookings();
  }

  @override
  Future<Either<Failure, List<BookingEntity>>> getUserBookings() {
    // TODO: implement getUserBookings
    return bookingLocalDataSource.getUserBookings();
  }

  // @override
  // Future<Either<Failure, bool>> addBooking(BookingEntity booking) {
  //   // TODO: implement addBooking
  //   throw UnimplementedError();
  // }

  @override
  Future<Either<Failure, bool>> addBooking(BookingEntity booking) {
    // TODO: implement addBooking
    throw UnimplementedError();
  }
}
