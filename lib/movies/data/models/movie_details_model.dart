import 'package:movie_app/movies/domain/entities/movie_details_entity.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  const MovieDetailsModel({
    required super.backDropPath,
    required super.genres,
    required super.id,
    required super.overview,
    required super.runTime,
    required super.releaseDate,
    required super.title,
    required super.voteAverage,
  });
  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      backDropPath: json['backdrop_path'],
      genres: json['genres']
          .map<Genres>((genre) => Genres.fromJson(genre))
          .toList(),
      id: json['id'],
      overview: json['overview'],
      runTime: json['runtime'],
      releaseDate: json['release_date'],
      title: json['title'],
      voteAverage: json['vote_average'].toDouble(),
    );
  }
}
