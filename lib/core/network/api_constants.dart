import 'package:movie_app/movies/domain/usecase/get_movie_details.dart';

class ApiConstants {
  static const String _apiKey = '4e44d9029b1270a757cddc766a1bcb63';
  static const String _baseUrl = 'https://api.themoviedb.org/3/';
  static const String nowPlayingMoviesPath =
      '${_baseUrl}movie/now_playing?api_key=$_apiKey';
  static const String popularMoviesPath =
      '${_baseUrl}movie/popular?api_key=$_apiKey';
  static const String topRatedMoviesPath =
      '${_baseUrl}movie/top_rated?api_key=$_apiKey';
  static const baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static String imageUrl(String path) => '$baseImageUrl$path';
  static String movieDetailsPath(int movieId) =>
      '${_baseUrl}movie/$movieId?api_key=$_apiKey';
  static String recommendationPath(int movieId) =>
      '${_baseUrl}movie/$movieId/recommendations?api_key=$_apiKey';
}
