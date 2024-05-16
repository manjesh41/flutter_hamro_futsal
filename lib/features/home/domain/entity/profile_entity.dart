import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String? userId;
  final String? userName;
  final String? fname;
  final String? email;
  final String? phoneNum;
  final String? lname;

  // final List<dynamic>? exchangedRequest;
  // final List<dynamic>? bookmarkedBooks;

  const ProfileEntity({
    this.userId,
    this.userName,
    this.fname,
    this.email,
    this.phoneNum,
    this.lname,

    // this.exchangedRequest,
    // this.bookmarkedBooks,
  });

  factory ProfileEntity.fromJson(Map<String, dynamic> json) => ProfileEntity(
        userId: json["userId"],
        userName: json["userName"],
        fname: json["fname"],
        email: json["email"],
        phoneNum: json["phoneNum"],
        lname: json["lname"],

        // exchangedRequest: json["exchangedRequest"],
        // bookmarkedBooks: json["bookmarkedBooks"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "username": userName,
        "fullname": fname,
        "email": email,
        "phoneNumber": phoneNum,
        "lname": lname,

        // "exchangedRequest": exchangedRequest,
        // "bookmarkedBooks": bookmarkedBooks,
      };

  @override
  List<Object?> get props => [
        userId,
        userName,
        fname,
        email,
        phoneNum,
        lname,
        // exchangedRequest,
        // bookmarkedBooks,
      ];
}
// class ProfileApiModel {
//   List<ProfileEntity> toEntityList(List<Map<String, dynamic>> dataList) {
//     return dataList.map((data) => ProfileEntity.fromJson(data)).toList();
//   }
// }