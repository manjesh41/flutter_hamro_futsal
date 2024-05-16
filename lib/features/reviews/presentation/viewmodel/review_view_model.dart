import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/use_case/review_usecase.dart';
import '../state/review_state.dart';

final reviewViewModelProvider =
    StateNotifierProvider<ReviewViewModel, ReviewState>(
  (ref) => ReviewViewModel(ref.watch(reviewUsecaseProvider)),
);

class ReviewViewModel extends StateNotifier<ReviewState> {
  final ReviewUseCase reviewUseCase;

  ReviewViewModel(this.reviewUseCase) : super(ReviewState.initial()) {
    getAllReview();
  }

  // deleteBatch() {}

  addReview(String review) async {
    state.copyWith(isLoading: true);
    var data = await reviewUseCase.addReview(review);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, error: null),
    );
  }

  getAllReview() async {
    state = state.copyWith(isLoading: true);
    var data = await reviewUseCase.getAllReviews();
    state = state.copyWith(reviews: []);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, reviews: r, error: null),
    );
  }

  getUserById(String id) async {
    state = state.copyWith(isLoading: true);
    var data = await reviewUseCase.getUserById(id);
    state = state.copyWith(userIds: []);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, userIds: r,
       error: null),
    );
  }
}
