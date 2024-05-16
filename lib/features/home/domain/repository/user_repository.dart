import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harmo_futsal/features/auth/domain/entity/student_entity.dart';

import '../../../../core/failure/failure.dart';
import '../../data/repository/user_remote_repo.dart';

final userRepositoryProvider = Provider<IUserRepository>((ref) {
  return ref.read(userRemoteRepositoryProvider);
});

abstract class IUserRepository {
  Future<Either<Failure, List<UserEntity>>> getAllUsers();
  Future<Either<Failure, bool>> deleteUser(String id);
}
