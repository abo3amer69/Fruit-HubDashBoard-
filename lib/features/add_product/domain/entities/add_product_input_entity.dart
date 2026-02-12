import 'dart:io';

class AddProductInputEntity {
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
  final num avgRating=0;
  final num ratingCount=0;
  final int unitAmout;

  AddProductInputEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.isFeatured,
    this.imageUrl,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmout,
      this.isOrganic=false,
  });
}
