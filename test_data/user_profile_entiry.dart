import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:harmo_futsal/features/home/domain/entity/profile_entity.dart';

Future<List<ProfileEntity>> getUserProfile() async {
  final response = await rootBundle.loadString('test_data/get_review.json');
  final jsonList = await json.decode(response);

  final List<ProfileEntity> profileList = jsonList
      .map<ProfileEntity>(
        (json) => ProfileEntity.fromJson(json),
      )
      .toList();

  print(profileList);
  return Future.value(profileList);
}
