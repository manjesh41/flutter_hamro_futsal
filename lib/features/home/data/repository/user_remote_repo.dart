import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../../auth/domain/entity/student_entity.dart';
import '../../domain/repository/user_repository.dart';
import '../data_source/user_remote_datasource.dart';

final userRemoteRepositoryProvider =
    Provider.autoDispose<IUserRepository>((ref) {
  return UserRemoteRepository(
    ref.read(userRemoteDataSourceProvider),
  );
});

class UserRemoteRepository implements IUserRepository {
  final UserRemoteDataSource _userRemoteDataSource;

  UserRemoteRepository(this._userRemoteDataSource);

  @override
  Future<Either<Failure, List<UserEntity>>> getAllUsers() {
    return _userRemoteDataSource.getAllUsers();
  }

  @override
  Future<Either<Failure, bool>> deleteUser(String id) {
    return _userRemoteDataSource.deleteUser(id);
  }
}
