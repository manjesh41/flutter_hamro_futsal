import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harmo_futsal/features/home/data/dto/get_all_user_dto.dart';
import 'package:harmo_futsal/features/home/data/model/user_api_model.dart';

import '../../../../config/constants/api_endpoint.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_service.dart';
import '../../../../core/shared_preferance/user_shared_prefs.dart';
import '../../../auth/domain/entity/student_entity.dart';

final userRemoteDataSourceProvider = Provider(
  (ref) => UserRemoteDataSource(
      dio: ref.read(httpServiceProvider),
      userSharedPrefs: ref.read(userSharedPrefsProvider),
      userApiModel: ref.read(userApiModelProvider)),
);

class UserRemoteDataSource {
  final Dio dio;
  final UserSharedPrefs userSharedPrefs;
  final UserApiModel userApiModel;

  UserRemoteDataSource(
      {required this.userSharedPrefs,
      required this.dio,
      required this.userApiModel});

  Future<Either<Failure, bool>> deleteUser(String id) async {
    try {
      print("ada:$id");
      String? token;
      await userSharedPrefs.getUserToken().then(
            (value) => value.fold((l) => null, (r) => token = r),
          );

      var response = await dio.delete(
        '${ApiEndpoints.deleteUser}/$id',
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

  Future<Either<Failure, List<UserEntity>>> getAllUsers() async {
    try {
      String? token;
      await userSharedPrefs.getUserToken().then(
            (value) => value.fold((l) => null, (r) => token = r),
          );
      var response = await dio.get(
        ApiEndpoints.getAllUser,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (response.statusCode == 200) {
        // OR
        // 2nd way
        print(response.data);
        GetAllUserDTO reviewAddDTO = GetAllUserDTO.fromJson(response.data);
        return Right(userApiModel.toEnitityList(reviewAddDTO.data));
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
