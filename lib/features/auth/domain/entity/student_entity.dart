import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String fname;
  final String lname;

  final String phoneNum;
  final String email;

  final String userName;
  final String? password;

  const UserEntity({
    this.id,
    required this.fname,
    required this.lname,
    required this.email,
    required this.phoneNum,
    required this.userName,
    this.password,
  });
  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
      id: json['id'],
      email: json['email'],
      phoneNum: json['phoneNum'],
      fname: json['fname'],
      lname: json['lname'],
      userName: json['userName'],
      password: json['password']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'phoneNum': phoneNum,
        'fname': fname,
        'lname': lname,
        'userName': userName,
        'password': password
      };

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, fname, lname, phoneNum, email, password, userName];
}
