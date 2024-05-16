import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:harmo_futsal/features/reviews/domain/entity/reviews_entity.dart';

Future<List<ReviewEntity>> getAllReviews() async {
  final response = await rootBundle.loadString('test_data/get_review.json');
  final jsonList = await json.decode(response);

  final List<ReviewEntity> ReviewList = jsonList
      .map<ReviewEntity>(
        (json) => ReviewEntity.fromJson(json),
      )
      .toList();

  print(ReviewList);
  return Future.value(ReviewList);
}
