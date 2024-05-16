import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/provider/internet_connectivity.dart';
import '../../../../core/failure/failure.dart';
import '../../data/repository/review_remote_repo_impl.dart';
import '../entity/reviews_entity.dart';
import '../entity/user_id_entity.dart';

final reviewRepositoryProvider = Provider<IReviewRepository>(
  (ref) {
    // return ref.watch(batchLocalRepoProvider);
    // // Check for the internet
    final internetStatus = ref.watch(connectivityStatusProvider);

    return ref.watch(reviewRemoteRepoProvider);
  },
);

abstract class IReviewRepository {
  Future<Either<Failure, List<ReviewEntity>>> getAllReviews();
  Future<Either<Failure, bool>> addReview(String review);
  Future<Either<Failure, List<UserIdEntity>>> getUserById(String id);
}
