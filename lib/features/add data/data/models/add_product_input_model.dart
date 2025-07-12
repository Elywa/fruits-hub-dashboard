import 'dart:io';

import 'package:fruits_hub_dash_board/features/add%20data/data/models/review_model.dart';
import 'package:fruits_hub_dash_board/features/add%20data/domain/entity/add_product_input_entity.dart';
import 'package:fruits_hub_dash_board/features/add%20data/domain/entity/review_entity.dart';

class AddProductInputModel {
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
  final List<ReviewModel> reviews;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int sellingCount;
  AddProductInputModel({
    required this.reviews,
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
    required this.isOrganic,
    this.sellingCount = 0,
  });

  factory AddProductInputModel.fromJson(
    AddProductInputEntity addProductInputEntity,
  ) {
    return AddProductInputModel(
      reviews:
          addProductInputEntity.reviewEntity
              .map((reviewEntity) => ReviewModel.fromEntity(reviewEntity))
              .toList(),
      name: addProductInputEntity.name,
      code: addProductInputEntity.code,
      description: addProductInputEntity.description,
      price: addProductInputEntity.price,
      image: addProductInputEntity.image,
      imageUrl: addProductInputEntity.imageUrl,
      isFeatured: addProductInputEntity.isFeatured,
      expirationMonths: addProductInputEntity.expirationMonths,
      numOfCalories: addProductInputEntity.numOfCalories,
      unitAmount: addProductInputEntity.unitAmount,
      isOrganic: addProductInputEntity.isOrganic,
    );
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'isFeatured': isFeatured,
      'isOrganic': isOrganic,
      'expirationDate': expirationMonths,
      'numOfCalories': numOfCalories,
      'unitAmount': unitAmount,
      "reviews": reviews.map((review) => review.toJson()).toList(),
      "sellingCount": sellingCount,
    };
  }
}
