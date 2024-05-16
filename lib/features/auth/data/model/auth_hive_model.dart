// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:harmo_futsal/features/auth/domain/entity/student_entity.dart';
// import 'package:hive/hive.dart';
// import 'package:uuid/uuid.dart';

// import '../../../../config/constants/hive_table_constrant.dart';

// part 'auth_hive_model.g.dart';

// final authHiveModelProvider = Provider(
//   (ref) => AuthHiveModel.empty(),
// );

// @HiveType(typeId: HiveTableConstant.usersTableId)
// class AuthHiveModel {
//   @HiveField(0)
//   final String userId;

//   @HiveField(1)
//   final String fname;

//   @HiveField(2)
//   final String lname;

//   @HiveField(3)
//   final String email;

//   @HiveField(4)
//   final String phoneNum;

//   @HiveField(5)
//   final String userName;

//   @HiveField(6)
//   final String password;

//   // Constructor
//   AuthHiveModel({
//     required this.fname,
//     required this.lname,
//     required this.email,
//     required this.phoneNum,
//     required this.userName,
//     required this.password,
//     String? userId,
//   }) : userId = userId ?? const Uuid().v4();

//   // empty constructor
//   AuthHiveModel.empty()
//       : this(
//           userId: '',
//           fname: '',
//           lname: '',
//           email: '',
//           phoneNum: '',
//           userName: '',
//           password: '',
//         );

//   // Convert Hive Object to Entity
//   UserEntity toEntity() => UserEntity(
//         id: userId,
//         fname: fname,
//         email: email,
//         lname: lname,
//         phoneNum: phoneNum,
//         userName: userName,
//         password: password,
//       );

//   // Convert Entity to Hive Object
//   AuthHiveModel toHiveModel(UserEntity entity) => AuthHiveModel(
//         userId: const Uuid().v4(),
//         fname: entity.fname,
//         lname: entity.lname,
//         phoneNum: entity.phoneNum,
//         userName: entity.userName,
//         password: entity.password!,
//         email: entity.email,
//       );

//   // Convert Entity List to Hive List
//   List<AuthHiveModel> toHiveModelList(List<UserEntity> entities) =>
//       entities.map((entity) => toHiveModel(entity)).toList();

//   @override
//   String toString() {
//     return 'studentId: $userId, fname: $fname, lname: $lname, phone: $phoneNum, password: $password';
//   }
// }
