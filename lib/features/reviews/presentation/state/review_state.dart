import 'package:harmo_futsal/features/auth/domain/entity/student_entity.dart';

import '../../domain/entity/reviews_entity.dart';
import '../../domain/entity/user_id_entity.dart';

class ReviewState {
  late final bool isLoading;
  late final List<ReviewEntity> reviews;
  late final List<UserEntity>? users;
  late final String? error;
  late final List<UserIdEntity> userIds;

  ReviewState({
    this.users,
    required this.isLoading,
    required this.reviews,
    required this.userIds,
    this.error,
  });

  factory ReviewState.initial() {
    return ReviewState(
      isLoading: false,
      userIds: [],
      users: [],
      reviews: [],
    );
  }

  ReviewState copyWith({
    bool? isLoading,
    List<ReviewEntity>? reviews,
    List<UserIdEntity>? userIds,
    List<UserEntity>? users,
    String? error,
  }) {
    return ReviewState(
      isLoading: isLoading ?? this.isLoading,
      reviews: reviews ?? this.reviews,
      users: users ?? this.users,
      userIds: userIds ?? this.userIds,
      error: error ?? this.error,
    );
  }
}
