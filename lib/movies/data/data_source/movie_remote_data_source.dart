import 'package:dio/dio.dart';
import 'package:movie_app/core/error/server_exception.dart';
import 'package:movie_app/core/network/api_constants.dart';
import 'package:movie_app/core/network/error_message_model.dart';
import 'package:movie_app/movies/data/models/movie_model.dart';
import 'package:movie_app/movies/domain/usecase/get_movie_details.dart';

import '../../domain/usecase/get_recommendation.dart';
import '../models/movie_details_model.dart';
import '../models/recommendation_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);
  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    var response = await Dio().get(ApiConstants.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return (List.from(response.data['results']))
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    var response = await Dio().get(ApiConstants.popularMoviesPath);
    if (response.statusCode == 200) {
      return (List.from(response.data['results']))
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    var response = await Dio().get(ApiConstants.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return (List.from(response.data['results']))
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameters parameters) async {
    var response =
        await Dio().get(ApiConstants.movieDetailsPath(parameters.movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameters parameters) async {
    var response =
        await Dio().get(ApiConstants.recommendationPath(parameters.id));
    if (response.statusCode == 200) {
      return (List.from(response.data['results']))
          .map((e) => RecommendationModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
