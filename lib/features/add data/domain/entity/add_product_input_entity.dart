import 'dart:io';

import 'package:fruits_hub_dash_board/features/add%20data/domain/entity/review_entity.dart';

class AddProductInputEntity {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  String? imageUrl;
  final bool isFeatured;
  final bool isOrganic;
  final int expirationMonths;
  final int numOfCalories;
  final int unitAmount;
  final num avgRating = 0;
  final num ratingCount = 0;
  final List<ReviewEntity> reviewEntity;
  AddProductInputEntity({
    required this.reviewEntity,
    required this.expirationMonths,
    required this.numOfCalories,
    required this.unitAmount,
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    this.imageUrl,
    required this.isFeatured,
    this.isOrganic = false,
  });
}
