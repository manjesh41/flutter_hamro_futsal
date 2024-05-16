import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harmo_futsal/features/reviews/data/dto/get_user_dto.dart';
import 'package:harmo_futsal/features/reviews/data/model/user_id_api_model.dart';

import '../../../../config/constants/api_endpoint.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/remote/http_service.dart';
import '../../../../core/shared_preferance/user_shared_prefs.dart';
import '../../domain/entity/reviews_entity.dart';
import '../../domain/entity/user_id_entity.dart';
import '../dto/get_all_review_dto.dart';
import '../model/review_api_model.dart';

final reviewRemoteDataSourceProvider = Provider(
  (ref) => ReviewRemoteDataSource(
      dio: ref.read(httpServiceProvider),
      reviewApiModel: ref.read(reviewApiModelProvider),
      userSharedPrefs: ref.read(userSharedPrefsProvider),
      userIdApiModel: ref.read(userIdApiModelProvider)),
);

class ReviewRemoteDataSource {
  late final Dio dio;
  late final ReviewApiModel reviewApiModel;
  late final UserIdApiModel userIdApiModel;
  late final UserSharedPrefs userSharedPrefs;

  ReviewRemoteDataSource({
    required this.dio,
    required this.reviewApiModel,
    required this.userIdApiModel,
    required this.userSharedPrefs,
  });

  Future<Either<Failure, bool>> addReview(String text) async {
    try {
      String? token;
      await userSharedPrefs.getUserToken().then(
            (value) => value.fold((l) => null, (r) => token = r!),
          );

      var response = await dio.post(
        ApiEndpoints.addReview,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
        data: {"text": text},
      );

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
          error: e.message.toString(),
        ),
      );
    }
  }

  Future<Either<Failure, List<ReviewEntity>>> getAllReviews() async {
    try {
      String? token;
      await userSharedPrefs.getUserToken().then(
            (value) => value.fold((l) => null, (r) => token = r!),
          );

      var response = await dio.get(
        ApiEndpoints.getAllReview,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.statusCode == 200) {
        // OR
        // 2nd way
        GetAllReviewDTO reviewAddDTO = GetAllReviewDTO.fromJson(response.data);
        return Right(reviewApiModel.toEntityList(reviewAddDTO.data));
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

  Future<Either<Failure, List<UserIdEntity>>> getUserById(String id) async {
    try {
      String? token;
      await userSharedPrefs.getUserToken().then(
            (value) => value.fold((l) => null, (r) => token = r!),
          );

      var response = await dio.get(
        "${ApiEndpoints.userById}$id",
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.statusCode == 200) {
        // OR
        // 2nd way
        GetUserIdDTO useridAddDTO = GetUserIdDTO.fromJson(response.data);
        return Right(userIdApiModel.toEntityList(useridAddDTO.data));
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
