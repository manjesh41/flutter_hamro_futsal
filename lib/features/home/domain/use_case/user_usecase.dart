import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harmo_futsal/features/auth/domain/entity/student_entity.dart';

import '../../../../core/failure/failure.dart';
import '../repository/user_repository.dart';

final userUseCaseProvider = Provider((ref) {
  return UserUseCase(
    ref.read(userRepositoryProvider),
  );
});

class UserUseCase {
  final IUserRepository _userRepository;

  UserUseCase(this._userRepository);

  Future<Either<Failure, List<UserEntity>>> getAllUsers() async {
    return await _userRepository.getAllUsers();
  }

  Future<Either<Failure, bool>> deleteUser(String id) async {
    return await _userRepository.deleteUser(id);
  }
}
