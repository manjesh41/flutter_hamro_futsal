import 'package:harmo_futsal/features/auth/domain/entity/student_entity.dart';

class UserState {
  late final bool isLoading;
  late final List<UserEntity>? users;
  late final String? error;

  UserState({
    this.users,
    required this.isLoading,
    this.error,
  });

  factory UserState.initial() {
    return UserState(
      isLoading: false,
      users: [],
    );
  }

  UserState copyWith({
    bool? isLoading,
    List<UserEntity>? users,
    String? error,
  }) {
    return UserState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
      error: error ?? this.error,
    );
  }
}
