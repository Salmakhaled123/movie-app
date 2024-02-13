import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movies/domain/usecase/get_movie_details.dart';
import 'package:movie_app/movies/domain/usecase/get_recommendation.dart';

import '../entities/movie_details_entity.dart';
import '../entities/movie_entity.dart';
import '../entities/recommendation_entity.dart';

abstract class BaseMovieRepo {
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies();
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies();
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(
      MovieDetailsParameters parameters);
  Future<Either<Failure, List<RecommendationEntity>>> getRecommendation(
      RecommendationParameters parameters);
}
