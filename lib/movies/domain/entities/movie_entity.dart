import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genreIds;
  final String overview;
  final num voteAverage;
  final String releaseDate;

  const MovieEntity({
    required this.releaseDate,
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genreIds,
    required this.overview,
    required this.voteAverage,
  });

  @override
  List<Object> get props => [
        id,
        title,
        releaseDate,
        backdropPath,
        genreIds,
        overview,
        voteAverage,
      ];
}
