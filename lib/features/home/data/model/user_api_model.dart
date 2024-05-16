import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../auth/domain/entity/student_entity.dart';

part 'user_api_model.g.dart';

final userApiModelProvider = Provider<UserApiModel>(
  (ref) => const UserApiModel.empty(),
);

@JsonSerializable()
class UserApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String fname;
  final String lname;
  final String userName;
  final String email;
  final String phoneNum;
  final String? password;

  const UserApiModel(
      {this.id,
      required this.email,
      required this.fname,
      required this.lname,
      required this.phoneNum,
      required this.userName,
      this.password});

  const UserApiModel.empty()
      : id = '',
        email = '',
        phoneNum = '',
        fname = '',
        lname = '',
        userName = '',
        password = '';

//convert Entity to API obj
  UserEntity toEntity() => UserEntity(
      id: id ?? '',
      email: email ?? '',
      phoneNum: phoneNum ?? '',
      fname: fname ?? '',
      lname: lname ?? '',
      userName: userName ?? '',
      password: password ?? '');

// Convert Entity to API Object
  UserApiModel fromEntity(UserEntity entity) => UserApiModel(
      id: entity.id,
      userName: entity.userName,
      phoneNum: entity.phoneNum,
      fname: entity.fname,
      lname: entity.lname,
      email: entity.email);

  List<UserEntity> toEnitityList(List<UserApiModel> list) =>
      list.map((e) => e.toEntity()).toList();

  factory UserApiModel.fromJson(Map<String, dynamic> json) =>
      _$UserApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserApiModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
