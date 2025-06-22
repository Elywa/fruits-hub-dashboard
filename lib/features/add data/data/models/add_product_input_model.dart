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

  AddProductInputModel({
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
      'image': image.path, // Assuming you want to store the path of the image
    };
  }
}
