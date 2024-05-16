import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entity/password_entity.dart';

import '../../domain/use_case/profile_usecase.dart';
import '../state/password_state.dart';

final passwordViewModelProvider =
    StateNotifierProvider<PasswordViewModel, PasswordState>(
  (ref) => PasswordViewModel(ref.read(profileUsecaseProvider)),
);

class PasswordViewModel extends StateNotifier<PasswordState> {
  final ProfileUseCase profileUseCase;

  PasswordViewModel(this.profileUseCase) : super(PasswordState.initial());

  changePassword(PasswordEntity password) async {
    state = state.copyWith(isLoading: true);
    var data = await profileUseCase.changePassword(password);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, error: null),
    );
  }
}
