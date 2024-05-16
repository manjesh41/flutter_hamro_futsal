import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harmo_futsal/features/reviews/domain/entity/reviews_entity.dart';

import '../../../../core/failure/failure.dart';
import '../entity/user_id_entity.dart';
import '../repository/review_reposit0ry.dart';

final reviewUsecaseProvider = Provider<ReviewUseCase>(
  (ref) => ReviewUseCase(
    reviewRepository: ref.watch(reviewRepositoryProvider),
  ),
);

class ReviewUseCase {
  final IReviewRepository reviewRepository;

  ReviewUseCase({required this.reviewRepository});

  Future<Either<Failure, List<ReviewEntity>>> getAllReviews() {
    return reviewRepository.getAllReviews();
  }

  Future<Either<Failure, bool>> addReview(String review) {
    return reviewRepository.addReview(review);
  }

  Future<Either<Failure, List<UserIdEntity>>> getUserById(String id) {
    return reviewRepository.getUserById(id);
  }
}
