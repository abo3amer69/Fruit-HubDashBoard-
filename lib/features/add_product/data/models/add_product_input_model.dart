import 'dart:io';

import 'package:fruits_apps_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class AddProductInputModel {
  final String name;

  final String code;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int unitAmout;

  AddProductInputModel({
    required this.name,
    required this.code,
    required this.description,
    required this.isOrganic,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmout,
    required this.price,
    required this.image,
    required this.isFeatured,
    this.imageUrl,
  });

  factory AddProductInputModel.fromEntity(
    AddProductInputEntity addProductInputEntity,
  ) {
    return AddProductInputModel(
      name: addProductInputEntity.name,
      code: addProductInputEntity.code,
      description: addProductInputEntity.description,
      price: addProductInputEntity.price,
      isOrganic: addProductInputEntity.isOrganic,
      image: addProductInputEntity.image,
      expirationMonths: addProductInputEntity.expirationMonths,
      numberOfCalories: addProductInputEntity.numberOfCalories,
      unitAmout: addProductInputEntity.unitAmout,
      isFeatured: addProductInputEntity.isFeatured,
      imageUrl: addProductInputEntity.imageUrl,
    );
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationMonths': expirationMonths,
      'numberOfCalories': numberOfCalories,
      'unitAmout': unitAmout,
      'isOrganic': isOrganic,
    };
  }
}
