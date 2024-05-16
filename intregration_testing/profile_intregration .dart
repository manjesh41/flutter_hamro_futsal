import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harmo_futsal/features/home/domain/entity/profile_entity.dart';
import 'package:harmo_futsal/features/home/domain/use_case/profile_usecase.dart';
import 'package:harmo_futsal/features/home/presentation/view/user/user_profile_get.dart';
import 'package:harmo_futsal/features/home/presentation/viewmodel/profile_state.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';

import '../build/app/intermediates/assets/debug/mergeDebugAssets/flutter_assets/test_data/user_profile_entiry.dart';
import '../test/unit_testing/profile_test.mocks.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  TestWidgetsFlutterBinding.ensureInitialized();
  late ProfileUseCase mockProfileUsecase;
  late List<ProfileEntity> profileList;

  setUpAll(() async {
    mockProfileUsecase = MockProfileUseCase();
    profileList = await getUserProfile();
  });

  testWidgets("profile View", (taster) async {
    when(mockProfileUsecase.getUserInfo())
        .thenAnswer((_) async => Right(profileList));

    await taster.pumpWidget(
      ProviderScope(
        overrides: [
          profileViewModelProvider.overrideWith(
            (ref) => ProfileViewModel(mockProfileUsecase),
          ),
        ],
        child: const MaterialApp(
          home: UserProfilePage(),
        ),
      ),
    );

    await taster.pumpAndSettle();

    expect(find.byType(ListView), findsWidgets);
    final listViewWidgets = taster.widgetList<ListView>(find.byType(ListView));

    final itemCounts = listViewWidgets
        .map((listView) => listView.childrenDelegate.estimatedChildCount ?? 0)
        .toList();

    expect(itemCounts.length, 1);
  });
}
