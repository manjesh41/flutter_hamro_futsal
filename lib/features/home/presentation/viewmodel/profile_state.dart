import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harmo_futsal/features/home/domain/use_case/profile_usecase.dart';
import 'package:harmo_futsal/features/home/presentation/state/profile_state.dart';

import '../../domain/entity/profile_entity.dart';

final profileViewModelProvider =
    StateNotifierProvider<ProfileViewModel, ProfileState>(
  (ref) => ProfileViewModel(ref.watch(profileUsecaseProvider)),
);

class ProfileViewModel extends StateNotifier<ProfileState> {
  final ProfileUseCase profileUseCase;

  ProfileViewModel(this.profileUseCase) : super(ProfileState.initial()) {
    getUserInfo();
  }

  updateProfile(ProfileEntity profile) async {
    state = state.copyWith(isLoading: true);
    var data = await profileUseCase.editProfile(profile);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, error: null),
    );
  }

  getUserInfo() async {
    state = state.copyWith(isLoading: true);
    var data = await profileUseCase.getUserInfo();
    print(data);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) =>
          state = state.copyWith(isLoading: false, usersData: r, error: null),
    );
  }
}
