import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entity/reviews_entity.dart';
import '../../domain/entity/user_id_entity.dart';
import '../../domain/repository/review_reposit0ry.dart';
import '../data_source/reviews_remote_datasource.dart';

final reviewRemoteRepoProvider = Provider<IReviewRepository>(
  (ref) => ReviewRemoteRepositoryImpl(
    reviewRemoteDataSource: ref.read(reviewRemoteDataSourceProvider),
  ),
);

class ReviewRemoteRepositoryImpl implements IReviewRepository {
  final ReviewRemoteDataSource reviewRemoteDataSource;

  ReviewRemoteRepositoryImpl({required this.reviewRemoteDataSource});

  @override
  Future<Either<Failure, bool>> addReview(String review) {
    return reviewRemoteDataSource.addReview(review);
  }

  @override
  Future<Either<Failure, List<ReviewEntity>>> getAllReviews() {
    return reviewRemoteDataSource.getAllReviews();
  }

  @override
  Future<Either<Failure, List>> addBooking(ReviewEntity review) {
    // TODO: implement addBooking
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<UserIdEntity>>> getUserById(String id) {
    return reviewRemoteDataSource.getUserById(id);
  }
}
