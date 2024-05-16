import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harmo_futsal/features/auth/domain/entity/student_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_api_model.g.dart';

final userProvider = Provider<Users>(
  (ref) => Users.empty(),
);

@JsonSerializable()
class Users {
  String? fname;
  String? lname;
  String? userName;
  String? email;
  String? phoneNum;
  String? password;

  Users({
    this.fname,
    this.lname,
    this.userName,
    this.email,
    this.phoneNum,
    this.password,
  });
  Users.empty()
      : fname = '',
        lname = '',
        userName = '',
        email = '',
        phoneNum = '',
        password = '';

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
  Map<String, dynamic> toJson() => _$UsersToJson(this);

  // Convert API Object to Entity
  UserEntity toEntity() => UserEntity(
        fname: fname ?? '',
        lname: lname ?? '',
        userName: userName ?? '',
        email: email ?? '',
        phoneNum: phoneNum ?? '',
        password: password ?? '',
      );

  // Convert Entity to API Object

  static Users fromEntity(UserEntity entity) => Users(
        fname: entity.fname,
        lname: entity.lname,
        userName: entity.userName,
        email: entity.email,
        phoneNum: entity.phoneNum,
        password: entity.password,
      );

  // Convert AuthApiModel list to AuthEntity list
  List<UserEntity> listFromJson(List<Users> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  String toString() {
    return 'AuthApiModel( fname: $fname, lname: $lname, userName: $userName, email: $email, phoneNum: $phoneNum, password: $password,)';
  }
}
