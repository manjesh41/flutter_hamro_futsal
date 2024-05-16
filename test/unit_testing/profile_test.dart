import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harmo_futsal/features/home/domain/entity/profile_entity.dart';
import 'package:harmo_futsal/features/home/domain/use_case/profile_usecase.dart';
import 'package:harmo_futsal/features/home/presentation/viewmodel/profile_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../test_data/user_profile_entiry.dart';
import 'profile_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<ProfileUseCase>(),
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ProviderContainer container;
  late ProfileUseCase mockProfileUsecase;
  late List<ProfileEntity> profileList;

  setUpAll(() async {
    mockProfileUsecase = MockProfileUseCase();
    profileList = await getUserProfile();

    when(mockProfileUsecase.getUserInfo())
        .thenAnswer((_) async => const Right([]));

    container = ProviderContainer(
      overrides: [
        profileViewModelProvider.overrideWith(
          (ref) => ProfileViewModel(mockProfileUsecase),
        )
      ],
    );
  });

  test('check home initial state', () async {
    await container.read(profileViewModelProvider.notifier).getUserInfo();
    final homeState = container.read(profileViewModelProvider);

    expect(homeState.isLoading, false);
    expect(homeState.usersData, isEmpty);
  });

  test('check for the list of books when calling getAllBooks', () async {
    when(mockProfileUsecase.getUserInfo())
        .thenAnswer((_) => Future.value(Right(profileList)));

    await container.read(profileViewModelProvider.notifier).getUserInfo();

    final homeState = container.read(profileViewModelProvider);

    expect(homeState.isLoading, false);
    expect(homeState.usersData, isNotEmpty);
  });
}
