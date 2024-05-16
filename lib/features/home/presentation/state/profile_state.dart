import '../../domain/entity/profile_entity.dart';

class ProfileState {
  final bool isLoading;
  final List<ProfileEntity> usersData;
  final String? error;

  ProfileState({
    required this.isLoading,
    required this.usersData,
    this.error,
  });

  factory ProfileState.initial() {
    return ProfileState(isLoading: false, usersData: []);
  }

  ProfileState copyWith({
    bool? isLoading,
    List<ProfileEntity>? usersData,
    String? error,
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      usersData: usersData ?? this.usersData,
      error: error ?? this.error,
    );
  }
}
