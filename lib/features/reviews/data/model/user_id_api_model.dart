import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';


import '../../domain/entity/user_id_entity.dart';

part 'user_id_api_model.g.dart';

final userIdApiModelProvider =
    Provider<UserIdApiModel>((ref) => const UserIdApiModel.empty());

@JsonSerializable()
class UserIdApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? userId;
  final String userName;
  final String fname;
  final String email;
  final String? phoneNum;
  final String? lname;
  // final List<dynamic>? exchangedRequest;
  // final List<dynamic>? bookmarkedBooks;

  const UserIdApiModel({
    this.userId,
    required this.userName,
    required this.fname,
    required this.email,
    this.phoneNum,
    this.lname,
    // this.exchangedRequest,
    // this.bookmarkedBooks,
  });

  const UserIdApiModel.empty()
      : userId = '',
        userName = '',
        fname = '',
        email = '',
        phoneNum = '',
        lname = '';

  // Convert API Object to Entity
  // ignore: empty_constructor_bodies
  UserIdEntity toEntity() => UserIdEntity(
        userId: userId ?? '',
        userName: userName,
        fname: fname,
        email: email,
        phoneNum: phoneNum,
        lname: lname,
        // exchangedRequest: exchangedRequest,
        // bookmarkedBooks: bookmarkedBooks,
      );

  // Convert Entity to API Object
  UserIdApiModel fromEntity(UserIdEntity entity) => UserIdApiModel(
        userId: userId ?? '',
        userName: userName,
        fname: fname,
        email: email,
        phoneNum: phoneNum,
        lname: lname,
        // exchangedRequest: exchangedRequest,
        // bookmarkedBooks: bookmarkedBooks,
      );

  // Convert API List to Entity List
  List<UserIdEntity> toEntityList(List<UserIdApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props => [
        userId,
        userName,
        fname,
        lname,
        email,
        phoneNum,

        // exchangedRequest,
        // bookmarkedBooks,
      ];

  factory UserIdApiModel.fromJson(Map<String, dynamic> json) =>

      _$UserIdApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserIdApiModelToJson(this);

}
