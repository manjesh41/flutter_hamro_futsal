import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/reviews_entity.dart';

part 'review_api_model.g.dart';

final reviewApiModelProvider = Provider<ReviewApiModel>(
  (ref) => const ReviewApiModel.empty(),
);

@JsonSerializable()
class ReviewApiModel extends Equatable {
  @JsonKey(name: 'id')
  final String? reviewid;
  @JsonKey(name: 'text')
  final String? text;
  @JsonKey(name: '__v')
  final int? v;
  final UserApiModel? user; // Update to use UserApiModel

  const ReviewApiModel({
    this.reviewid,
    this.text,
    this.v,
    this.user,
  });

  const ReviewApiModel.empty()
      : reviewid = '',
        text = '',
        v = 0,
        user = null; // Update to use UserApiModel.empty()

  // Convert Entity to API obj
  ReviewEntity toEntity() => ReviewEntity(
      id: reviewid ?? '', text: text ?? '', v: v ?? 0, user: user?.toEntity() ?? User(id: '', fname: '', lname: '', userName: '', email: '', phoneNum: '', password: '', role: '', v: 0));

  // Convert Entity to API Object
  ReviewApiModel fromEntity(ReviewEntity entity) => ReviewApiModel(
        reviewid: entity.id,
        text: entity.text,
        v: entity.v,
        user: UserApiModel.fromEntity(entity.user),
      );

  // Convert api to entity list
  List<ReviewEntity> toEntityList(List<ReviewApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  @override
  List<Object?> get props => [
        reviewid,
        text,
        v,
        user,
      ];

  factory ReviewApiModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewApiModelToJson(this);
}

@JsonSerializable()
class UserApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String id;
  final String fname;
  final String lname;
  @JsonKey(name: 'userName')
  final String userName;
  final String email;
  @JsonKey(name: 'phoneNum')
  final String phoneNum;
  final String password;
  final String role;
  @JsonKey(name: '__v')
  final int v;

  const UserApiModel({
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

  const UserApiModel.empty()
      : id = '',
        fname = '',
        lname = '',
        userName = '',
        email = '',
        phoneNum = '',
        password = '',
        role = '',
        v = 0;

  // Convert Entity to API obj
  User toEntity() => User(
      id: id,
      fname: fname,
      lname: lname,
      userName: userName,
      email: email,
      phoneNum: phoneNum,
      password: password,
      role: role,
      v: v);

  // Convert Entity to API Object
  static UserApiModel fromEntity(User entity) => UserApiModel(
        id: entity.id,
        fname: entity.fname,
        lname: entity.lname,
        userName: entity.userName,
        email: entity.email,
        phoneNum: entity.phoneNum,
        password: entity.password,
        role: entity.role,
        v: entity.v,
      );

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

  factory UserApiModel.fromJson(Map<String, dynamic> json) =>
      _$UserApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserApiModelToJson(this);
}
