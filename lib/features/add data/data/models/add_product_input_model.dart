import 'dart:io';

import 'package:fruits_hub_dash_board/features/add%20data/domain/entity/add_product_input_entity.dart';

class AddProductInputModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  String? imageUrl;
  final bool isFeatured;
  final bool isOrganic = false;
  final int expirationMonths;
  final int numOfCalories;
  final int unitAmount;
  final num avgRating = 0;
  final num ratingCount = 0;
  AddProductInputModel({
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
  });

  factory AddProductInputModel.fromJson(
    AddProductInputEntity addProductInputEntity,
  ) {
    return AddProductInputModel(
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
    };
  }
}
