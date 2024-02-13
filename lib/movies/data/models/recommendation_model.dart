import 'package:movie_app/movies/domain/entities/recommendation_entity.dart';

class RecommendationModel extends RecommendationEntity {
  const RecommendationModel({required super.id, super.backdropPath});
  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
        id: json['id'],
        backdropPath:
            json['backdrop_path'] ?? '/cnqwv5Uz3UW5f086IWbQKr3ksJr.jpg');
  }
}
