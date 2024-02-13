import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/error/server_exception.dart';
import 'package:movie_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app/movies/domain/entities/movie_details_entity.dart';
import 'package:movie_app/movies/domain/entities/movie_entity.dart';
import 'package:movie_app/movies/domain/entities/recommendation_entity.dart';
import 'package:movie_app/movies/domain/repos/base_movie_repo.dart';
import 'package:movie_app/movies/domain/usecase/get_movie_details.dart';
import 'package:movie_app/movies/domain/usecase/get_recommendation.dart';

class MoviesRepo extends BaseMovieRepo {
  BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  MoviesRepo(this.baseMovieRemoteDataSource);
  @override
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies() async {
    try {
      var response = await baseMovieRemoteDataSource.getNowPlayingMovies();
      return Right(response);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(errorMessage: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() async {
    try {
      var response = await baseMovieRemoteDataSource.getPopularMovies();
      return Right(response);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(errorMessage: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies() async {
    try {
      var response = await baseMovieRemoteDataSource.getTopRatedMovies();
      return Right(response);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(errorMessage: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    try {
      var response =
          await baseMovieRemoteDataSource.getMovieDetails(parameters);
      return Right(response);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(errorMessage: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<RecommendationEntity>>> getRecommendation(
      RecommendationParameters parameters) async {
    try {
      var response =
          await baseMovieRemoteDataSource.getRecommendation(parameters);
      return Right(response);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(errorMessage: failure.errorMessageModel.statusMessage));
    }
  }
}
