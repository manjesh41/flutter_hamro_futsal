import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/provider/internet_connectivity.dart';
import '../../../../core/failure/failure.dart';
import '../../data/repository/profile_repo_impl.dart';
import '../entity/password_entity.dart';
import '../entity/profile_entity.dart';

final profileRepositoryProvider = Provider<IProfileRepository>(
  (ref) {
    // return ref.watch(batchLocalRepoProvider);
    // // Check for the internet
    final internetStatus = ref.watch(connectivityStatusProvider);

    return ref.watch(profileRemoteRepoProvider);

    // if (ConnectivityStatus.isConnected == internetStatus) {
    //   // If internet is available then return remote repo
    //   return ref.watch(profileRemoteRepoProvider);
    // } else {
    //   // If internet is not available then return local repo
    //   return ref.watch(profileLocalRepoProvider);
    // }
  },
);

abstract class IProfileRepository {
  Future<Either<Failure, List<ProfileEntity>>> getUserInfo();
  Future<Either<Failure, bool>> changePassword(PasswordEntity password);
  Future<Either<Failure, bool>> editProfile(ProfileEntity profile);
}
