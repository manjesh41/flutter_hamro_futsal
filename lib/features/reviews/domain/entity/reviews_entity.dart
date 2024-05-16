import 'package:equatable/equatable.dart';

class ReviewEntity extends Equatable {
  String text;
  User user;
  int v;
  String id;

  ReviewEntity({
    required this.text,
    required this.user,
    required this.v,
    required this.id,
  });

  factory ReviewEntity.fromJson(Map<String, dynamic> json) => ReviewEntity(
        text: json["text"],
        user: User.fromJson(json["user"]),
        v: json["__v"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "user": user.toJson(),
        "__v": v,
        "id": id,
      };

  @override
  List<Object?> get props => [
        text,
        user,
        v,
        id,
      ];
}

class User extends Equatable {
  String id;
  String fname;
  String lname;
  String userName;
  String email;
  String phoneNum;
  String password;
  String role;
  int v;

  User({
    required this.id,
    required this.fname,
    required this.lname,
    required this.userName,
    required this.email,
    required this.phoneNum,
    required this.password,
    required this.role,
    required this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        fname: json["fname"],
        lname: json["lname"],
        userName: json["userName"],
        email: json["email"],
        phoneNum: json["phoneNum"],
        password: json["password"],
        role: json["role"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fname": fname,
        "lname": lname,
        "userName": userName,
        "email": email,
        "phoneNum": phoneNum,
        "password": password,
        "role": role,
        "__v": v,
      };

  @override
  List<Object?> get props => [
        id,
        fname,
        lname,
        userName,
        email,
        phoneNum,
        password,
        role,
        v,
      ];
}
