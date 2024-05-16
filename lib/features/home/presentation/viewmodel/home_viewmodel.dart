import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harmo_futsal/features/home/domain/use_case/user_usecase.dart';

import '../../../../config/router/app_route.dart';
import '../../../../core/common/snackbar/my_snackbar.dart';
import '../../../../core/shared_preferance/user_shared_prefs.dart';
import '../state/user_state.dart';

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, UserState>(
  (ref) => HomeViewModel(
      ref.read(userSharedPrefsProvider), ref.read(userUseCaseProvider)),
);

class HomeViewModel extends StateNotifier<UserState> {
  final UserSharedPrefs _userSharedPrefs;
  final UserUseCase userUseCase;
  HomeViewModel(this._userSharedPrefs, this.userUseCase)
      : super(UserState.initial()) {
    getAllUsers();
  }

  void logout(BuildContext context) async {
    showSnackBar(
        message: 'Logging out....', context: context, color: Colors.red);

    await _userSharedPrefs.deleteUserToken();
    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoute.loginRoute,
        (route) => false,
      );
    });
  }

  getAllUsers() async {
    state = state.copyWith(isLoading: true);
    var data = await userUseCase.getAllUsers();
    state = state.copyWith(users: []);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, users: r, error: null),
    );
  }

  deleteUser(String id) async {
    state = state.copyWith(isLoading: true);
    var data = await userUseCase.deleteUser(id);

    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (r) => state = state.copyWith(isLoading: false, error: null),
    );
  }
}
