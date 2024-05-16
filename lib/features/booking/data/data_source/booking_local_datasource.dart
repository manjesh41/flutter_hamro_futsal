import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/network/local/hive_service.dart';
import '../../domain/entity/booking_entiry.dart';
import '../model/booking_hive_model.dart';

// Dependency Injection using Riverpod
final bookingLocalDataSourceProvider = Provider<BookingLocalDataSource>((ref) {
  return BookingLocalDataSource(
      hiveService: ref.read(hiveServiceProvider),
      bookingHiveModel: ref.read(bookingHiveModelProvider));
});

class BookingLocalDataSource {
  final HiveService hiveService;
  final BookingHiveModel bookingHiveModel;

  BookingLocalDataSource({
    required this.hiveService,
    required this.bookingHiveModel,
  });

  // Add Booking
  // Future<Either<Failure, bool>> addBooking(BookingEntity booking) async {
  //   try {
  //     // Convert Entity to Hive Object
  //     final hiveBooking = bookingHiveModel.toHiveModel(booking);
  //     // Add to Hive
  //     await hiveService.addBooking(hiveBooking);
  //     return const Right(true);
  //   } catch (e) {
  //     return Left(Failure(error: e.toString()));
  //   }
  // }

  Future<Either<Failure, List<BookingEntity>>> getAllBookings() async {
    try {
      // Get all bookinges from Hive
      final bookings = await hiveService.getAllBookings();
      // Convert Hive Object to Entity
      final bookingEntities = bookingHiveModel.toEntityList(bookings);
      return Right(bookingEntities);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  Future<Either<Failure, List<BookingEntity>>> getUserBookings() async {
    try {
      // Get all bookinges from Hive

      final bookings = await hiveService.getUsersBooking();
      print("booking local data source ${bookings.length}");
      // Convert Hive Object to Entity
      final bookingEntities = bookingHiveModel.toEntityList(bookings);
      return Right(bookingEntities);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
