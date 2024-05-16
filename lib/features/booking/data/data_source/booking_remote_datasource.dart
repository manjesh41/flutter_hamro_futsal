import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harmo_futsal/features/booking/data/model/booking_hive_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../config/constants/api_endpoint.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_service.dart';
import '../../../../core/shared_preferance/user_shared_prefs.dart';
import '../../domain/entity/booking_entiry.dart';
import '../dto/get_all_bookings_dto.dart';
import '../dto/get_user_booing_dto.dart';
import '../model/booking_api_model.dart';

final bookingRemoteDataSourceProvider = Provider(
  (ref) => BookingRemoteDataSource(
      dio: ref.read(httpServiceProvider),
      bookingApiModel: ref.read(bookingApiModelProvider),
      userSharedPrefs: ref.read(userSharedPrefsProvider),
      bookingHiveModel: ref.read(bookingHiveModelProvider)),
);

class BookingRemoteDataSource {
  late final Dio dio;
  late final BookingApiModel bookingApiModel;
  late final UserSharedPrefs userSharedPrefs;
  late final BookingHiveModel bookingHiveModel;

  BookingRemoteDataSource({
    required this.dio,
    required this.bookingApiModel,
    required this.userSharedPrefs,
    required this.bookingHiveModel,
  });

  Future<Either<Failure, bool>> addBooking(BookingEntity booking) async {
    try {
      String? token;
      await userSharedPrefs.getUserToken().then(
            (value) => value.fold((l) => null, (r) => token = r!),
          );
      var response = await dio.post(ApiEndpoints.addBooking,
          options: Options(
            headers: {'Authorization': 'Bearer $token'},
          ),
          // data: bookingApiModel.fromEntity(booking).toJson(),
          data: {
            // "user" : booking.user,
            "email": booking.email,
            "fullname": booking.fullname,
            "phoneNum": booking.phoneNum,
            "bookingDate": booking.bookingDate,
            "startTime": booking.startTime,
            "endTime": booking.endTime,
          });

      if (response.statusCode == 201) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }

  Future<Either<Failure, List<BookingEntity>>> getAllBookings() async {
    try {
      String? token;
      await userSharedPrefs.getUserToken().then(
            (value) => value.fold((l) => null, (r) => token = r!),
          );
      var response = await dio.get(
        ApiEndpoints.getAllBooking,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.statusCode == 200) {
        // OR
        // 2nd way
        GetAllBookingDTO batchAddDTO = GetAllBookingDTO.fromJson(response.data);
        final List<BookingEntity> smth =
            bookingApiModel.toEntityList(batchAddDTO.data);
        return Right(smth);
      } else {
        return Left(
          Failure(
            error: response.statusMessage.toString(),
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
        ),
      );
    }
  }

  Future<Either<Failure, List<BookingEntity>>> getUserBookings() async {
    try {
      String? token;
      await userSharedPrefs.getUserToken().then(
            (value) => value.fold((l) => null, (r) => token = r!),
          );
      var response = await dio.get(
        ApiEndpoints.getUserBooking,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.statusCode == 200) {
        // OR
        // 2nd wa
        GetUserBookingDTO batchAddDTO =
            GetUserBookingDTO.fromJson(response.data);
        var data = response.data["response"] as List<dynamic>;
        print(data);
        final List<BookingEntity> smth =
            bookingApiModel.toEntityList(batchAddDTO.response);
        List<BookingApiModel> booking = data
            .map((e) => BookingApiModel.fromJson(e as Map<String, dynamic>))
            .toList();

        final bookingHiveModels = bookingHiveModel.fromApiModelList(booking);
        print(bookingHiveModels);

        var directory = await getApplicationDocumentsDirectory();
        Hive.init(directory.path);

        final bookingBox = await Hive.openBox<BookingHiveModel>('bookingBox');

        bookingBox.clear();
        bookingBox.addAll(bookingHiveModels);

        return Right(smth);
      } else {
        return Left(
          Failure(
            error: response.statusMessage.toString(),
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
        ),
      );
    }
  }

  Future<Either<Failure, bool>> deleteBooking(String id) async {
    try {
      print("ada:$id");
      String? token;
      await userSharedPrefs.getUserToken().then(
            (value) => value.fold((l) => null, (r) => token = r),
          );

      var response = await dio.delete(
        '${ApiEndpoints.deleteBooking}/$id',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
        ),
      );
    }
  }
}
