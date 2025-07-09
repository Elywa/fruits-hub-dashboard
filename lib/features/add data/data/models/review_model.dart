import 'package:fruits_hub_dash_board/features/add%20data/domain/entity/review_entity.dart';

class ReviewModel {
  final String name;
  final String comment;
  final num rating;
  final String image;
  final String date;

  ReviewModel({
    required this.name,
    required this.comment,
    required this.rating,
    required this.image,
    required this.date,
  });
  toJson() {
    return {
      'name': name,
      'comment': comment,
      'rating': rating,
      'image': image,
      'date': date,
    };
  }

  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
      name: reviewEntity.name,
      comment: reviewEntity.comment,
      rating: reviewEntity.rating,
      image: reviewEntity.image,
      date: reviewEntity.date,
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'],
      comment: json['comment'],
      rating: json['rating'],
      image: json['image'],
      date: json['date'],
    );
  }
}
