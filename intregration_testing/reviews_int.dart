import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harmo_futsal/features/reviews/domain/entity/reviews_entity.dart';
import 'package:harmo_futsal/features/reviews/domain/use_case/review_usecase.dart';
import 'package:harmo_futsal/features/reviews/presentation/view/user_reviews/reviews.dart';
import 'package:harmo_futsal/features/reviews/presentation/viewmodel/review_view_model.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';

import '../build/app/intermediates/flutter/debug/flutter_assets/test_data/reviews_entiry.dart';
import '../test/unit_testing/reviews_test.mocks.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  TestWidgetsFlutterBinding.ensureInitialized();
  late ReviewUseCase mockReviewUsecase;
  late List<ReviewEntity> reviewList;
  late List<ReviewEntity> useReviews;

  setUpAll(() async {
    mockReviewUsecase = MockReviewUseCase();
    reviewList = await getAllReviews();
  });

  testWidgets('Reviews View', (tester) async {
    when(mockReviewUsecase.getAllReviews())
        .thenAnswer((_) async => Right(reviewList));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          reviewViewModelProvider.overrideWith(
            (ref) => ReviewViewModel(mockReviewUsecase),
          ),
        ],
        child: const MaterialApp(
          home: ReviewPage(), // Use the HomepageView directly
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(ListView), findsWidgets);
    final listViewWidgets = tester.widgetList<ListView>(find.byType(ListView));

    final itemCounts = listViewWidgets
        .map((listView) => listView.childrenDelegate.estimatedChildCount ?? 0)
        .toList();

    expect(itemCounts.length, 1);
  });
}
