import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harmo_futsal/features/booking/data/model/booking_api_model.dart';

import '../../../../config/constants/api_endpoint.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_service.dart';
import '../../../../core/shared_preferance/user_shared_prefs.dart';
import '../../domain/entity/password_entity.dart';
import '../../domain/entity/profile_entity.dart';
import '../dto/get_user_info_dto.dart';
import '../model/passwoed_model.dart';
import '../model/profile_api_model.dart';

final profileRemoteDataSourceProvider = Provider(
  (ref) => ProfileRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    profileApiModel: ref.read(profileApiModelProvider),
    passwordApiModel: ref.read(passwordApiModelProvider),
    bookingApiModel: ref.read(bookingApiModelProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
  ),
);

class ProfileRemoteDataSource {
  final Dio dio;
  final ProfileApiModel profileApiModel;
  final BookingApiModel bookingApiModel;
  final PasswordApiModel passwordApiModel;
  final UserSharedPrefs userSharedPrefs;

  ProfileRemoteDataSource({
    required this.dio,
    required this.profileApiModel,
    required this.passwordApiModel,
    required this.bookingApiModel,
    required this.userSharedPrefs,
  });

  Future<Either<Failure, bool>> changePassword(PasswordEntity password) async {
    try {
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );

      var response = await dio.put(
        ApiEndpoints.changePassword,
        data: {
          'currentPassword': password.oldPassword,
          'newPassword': password.newPassword,
          'confirmPassword': password.confirmPassword,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 204) {
        // Password changed successfully
        return const Right(true);
      } else if (response.statusCode == 401) {
        // Incorrect current password
        return Left(
          Failure(
            error: response.data['error'] ?? 'Incorrect current password',
          ),
        );
      } else {
        return Left(
          Failure(
            error: 'Failed to change password. Please try again.',
          ),
        );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse && e.response?.data != null) {
        // Incorrect current password
        return Left(
          Failure(
            error: e.response!.data['error'] ?? 'Incorrect current password',
          ),
        );
      } else {
        return Left(
          Failure(
            error: e.error.toString(),
          ),
        );
      }
    }
  }

  Future<Either<Failure, bool>> editProfile(ProfileEntity profile) async {
    try {
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );

      var response = await dio.put(
        ApiEndpoints.editProfile,
        data: {
          "fname": profile.fname,
          "lname": profile.lname,
          "email": profile.email,
          "phoneNum": profile.phoneNum,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 204) {
        // Profile edited successfully
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: 'Failed to edit profile. Please try again.',
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

  Future<Either<Failure, List<ProfileEntity>>> getUserInfo() async {
    try {
      String? token;

      await userSharedPrefs.getUserToken().then(
            (value) => value.fold((l) => null, (r) => token = r),
          );
      print(token);

      var response = await dio.get(
        ApiEndpoints.getUserProfile,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (response.statusCode == 200) {
        GetUserInfoDTO getUserInfoDTO = GetUserInfoDTO.fromJson(response.data);
        return Right(profileApiModel.toEntityList(getUserInfoDTO.data));
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
}
