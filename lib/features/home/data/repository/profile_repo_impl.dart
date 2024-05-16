import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entity/password_entity.dart';
import '../../domain/entity/profile_entity.dart';
import '../../domain/repository/profile_repo.dart';
import '../data_source/profile_remote_data_source.dart';

final profileRemoteRepoProvider = Provider<IProfileRepository>(
  (ref) => ProfileRemoteRepositoryImpl(
    profileRemoteDataSource: ref.read(profileRemoteDataSourceProvider),
  ),
);

class ProfileRemoteRepositoryImpl implements IProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRemoteRepositoryImpl({required this.profileRemoteDataSource});

  @override
  // Future<Either<Failure, List<ProfileEntity>>> getUserInfo() {
  //   return profileRemoteDataSource.getUserInfo();
  // }

  @override
  Future<Either<Failure, bool>> changePassword(PasswordEntity password) {
    return profileRemoteDataSource.changePassword(password);
  }

  @override
  Future<Either<Failure, bool>> editProfile(ProfileEntity profile) {
    return profileRemoteDataSource.editProfile(profile);
  }

  @override
  Future<Either<Failure, List<ProfileEntity>>> getUserInfo() {
    return profileRemoteDataSource.getUserInfo();
    // TODO: implement getUserInfo
  }

  // // @override
  // Future<Either<Failure, List<ProfileEntity>>> getUserInfo() {

  //   // TODO: implement getUserInfo
  //   throw UnimplementedError();
  // }
}
