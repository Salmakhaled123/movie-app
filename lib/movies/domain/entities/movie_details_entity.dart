import 'package:equatable/equatable.dart';

class MovieDetailsEntity extends Equatable {
  final String backDropPath;
  final int id;
  final String overview;
  final int runTime;
  final List<Genres> genres;
  final String releaseDate;
  final String title;
  final double voteAverage;
  const MovieDetailsEntity({
    required this.backDropPath,
    required this.genres,
    required this.id,
    required this.overview,
    required this.runTime,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [backDropPath, id, overview, runTime, releaseDate, title, voteAverage];
}

class Genres extends Equatable {
  final int id;
  final String name;
  const Genres({
    required this.id,
    required this.name,
  });
  factory Genres.fromJson(Map<String, dynamic> json) {
    return Genres(id: json['id'], name: json['name']);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, name];
}
