import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/profile_entity.dart';

part 'profile_api_model.g.dart';

final profileApiModelProvider =
    Provider<ProfileApiModel>((ref) => const ProfileApiModel.empty());

@JsonSerializable()
class ProfileApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? userId;
  final String userName;
  final String fname;
  final String email;
  final String? phoneNum;
  final String? lname;
  // final List<dynamic>? exchangedRequest;
  // final List<dynamic>? bookmarkedBooks;

  const ProfileApiModel({
    this.userId,
    required this.userName,
    required this.fname,
    required this.email,
    this.phoneNum,
    this.lname,
    // this.exchangedRequest,
    // this.bookmarkedBooks,
  });

  const ProfileApiModel.empty()
      : userId = '',
        userName = '',
        fname = '',
        email = '',
        phoneNum = '',
        lname = '';

  // Convert API Object to Entity
  // ignore: empty_constructor_bodies
  ProfileEntity toEntity() => ProfileEntity(
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
  ProfileApiModel fromEntity(ProfileEntity entity) => ProfileApiModel(
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
  List<ProfileEntity> toEntityList(List<ProfileApiModel> models) =>
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

  factory ProfileApiModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileApiModelToJson(this);
}
