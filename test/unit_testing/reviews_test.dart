import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harmo_futsal/features/reviews/domain/entity/reviews_entity.dart';
import 'package:harmo_futsal/features/reviews/domain/use_case/review_usecase.dart';
import 'package:harmo_futsal/features/reviews/presentation/viewmodel/review_view_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../test_data/reviews_entiry.dart';
import 'reviews_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<ReviewUseCase>(),
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ProviderContainer container;
  late ReviewUseCase mockReviewUsecase;
  late List<ReviewEntity> reviewList;
  late List<ReviewEntity> allReviews;

  setUpAll(() async {
    mockReviewUsecase = MockReviewUseCase();
    reviewList = await getAllReviews();

    when(mockReviewUsecase.getAllReviews())
        .thenAnswer((_) async => const Right([]));

    container = ProviderContainer(
      overrides: [
        reviewViewModelProvider.overrideWith(
          (ref) => ReviewViewModel(mockReviewUsecase),
        )
      ],
    );
  });

  test('check home initial state', () async {
    await container.read(reviewViewModelProvider.notifier).getAllReview();
    final homeState = container.read(reviewViewModelProvider);

    expect(homeState.isLoading, false);
    expect(homeState.reviews, isEmpty);
  });

  test('check for the list of books when calling getAll reviews', () async {
    when(mockReviewUsecase.getAllReviews())
        .thenAnswer((_) => Future.value(Right(reviewList)));

    await container.read(reviewViewModelProvider.notifier).getAllReview();

    final homeState = container.read(reviewViewModelProvider);

    expect(homeState.isLoading, false);
    expect(homeState.reviews, isNotEmpty);
  });
}
