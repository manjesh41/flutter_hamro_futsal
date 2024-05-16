// import 'dart:io';

// import 'package:dartz/dartz.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';


// import '../../../../core/failure/failure.dart';
// import '../../domain/entity/student_entity.dart';
// import '../../domain/repository/auth_repository.dart';
// import '../data_source/auth_local_data_source.dart';

// final authLocalRepositoryProvider = Provider<IAuthRepository>((ref) {
//   return AuthLocalRepository(
//     ref.read(authLocalDataSourceProvider),
//   );
// });

// class AuthLocalRepository implements IAuthRepository {
//   final AuthLocalDataSource _authLocalDataSource;

//   AuthLocalRepository(this._authLocalDataSource);

//   @override
//   Future<Either<Failure, bool>> loginUser(String userName, String password) {
//     return _authLocalDataSource.loginUser(userName, password);
//   }

//   @override
//   Future<Either<Failure, bool>> registerUser(UserEntity student) {
//     return _authLocalDataSource.registerUser(student);
//   }

//   @override
//   Future<Either<Failure, String>> uploadProfilePicture(File file) {
//     // TODO: implement uploadProfilePicture
//     throw UnimplementedError();
//   }
// }
