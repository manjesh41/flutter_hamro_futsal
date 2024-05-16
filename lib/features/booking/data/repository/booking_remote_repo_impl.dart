import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harmo_futsal/core/common/provider/internet_connectivity.dart';
import 'package:harmo_futsal/features/booking/data/data_source/booking_local_datasource.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entity/booking_entiry.dart';
import '../../domain/repository/booking_repositary.dart';
import '../data_source/booking_remote_datasource.dart';

final bookingRemoteRepoProvider = Provider<IBookingRepository>(
  (ref) => BookingRemoteRepositoryImpl(
    bookingRemoteDataSource: ref.read(bookingRemoteDataSourceProvider),
    bookingLocalDataSource: ref.read(bookingLocalDataSourceProvider),
  ),
);

class BookingRemoteRepositoryImpl implements IBookingRepository {
  final BookingRemoteDataSource bookingRemoteDataSource;
  final BookingLocalDataSource bookingLocalDataSource;

  BookingRemoteRepositoryImpl(
      {required this.bookingRemoteDataSource,
      required this.bookingLocalDataSource});

  @override
  Future<Either<Failure, bool>> addBooking(BookingEntity booking) {
    return bookingRemoteDataSource.addBooking(booking);
  }

  @override
  Future<Either<Failure, List<BookingEntity>>> getAllBookings() async {
    final a = await checkConnectivity();
    if (a) {
      print("game conneceted");
      return bookingRemoteDataSource.getAllBookings();
    } else {
      print("game not conneceted");
      return bookingLocalDataSource.getAllBookings();
    }
  }

  @override
  Future<Either<Failure, List<BookingEntity>>> getUserBookings() async {
    final a = await checkConnectivity();

    if (a) {
      print("game conneceted");
      return bookingRemoteDataSource.getUserBookings();
    } else {
      print("game not user conneceted");
      return bookingLocalDataSource.getUserBookings();
    }
  }

  @override
  Future<Either<Failure, bool>> deleteBooking(String id) {
    return bookingRemoteDataSource.deleteBooking(id);
  }
}
