import 'package:fruits_apps_dashboard/features/add_product/domain/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final num ratting;
  final String date;
  final String reviewDescripition;

  ReviewModel({
    required this.name,
    required this.image,
    required this.ratting,
    required this.date,
    required this.reviewDescripition,
  });

  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
      name: reviewEntity.name,
      image: reviewEntity.image,
      ratting: reviewEntity.ratting,
      date: reviewEntity.date,
      reviewDescripition: reviewEntity.reviewDescripition,
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'],
      image: json['image'],
      ratting: json['ratting'],
      date: json['date'],
      reviewDescripition: json['reviewDescripition'],
    );
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'ratting': ratting,
      'date': date,
      'reviewDescripition': reviewDescripition,
    };
  }
}
