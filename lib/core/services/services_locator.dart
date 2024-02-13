import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app/movies/data/repositories/movie_repo.dart';
import 'package:movie_app/movies/domain/repos/base_movie_repo.dart';
import 'package:movie_app/movies/domain/usecase/get_movie_details.dart';
import 'package:movie_app/movies/domain/usecase/get_now_playing_movies.dart';
import 'package:movie_app/movies/domain/usecase/get_popular_movies.dart';
import 'package:movie_app/movies/domain/usecase/get_recommendation.dart';
import 'package:movie_app/movies/domain/usecase/get_top_rated_movies.dart';
import 'package:movie_app/movies/presentation/controller/movie_details_bloc.dart';
import 'package:movie_app/movies/presentation/controller/movies_bloc.dart';

final getIt = GetIt.instance;
void setUp() {
  ///bloc
  getIt
      .registerFactory<MoviesBloc>(() => MoviesBloc(getIt(), getIt(), getIt()));
  getIt.registerFactory<MovieDetailsBloc>(
      () => MovieDetailsBloc(getIt(), getIt()));

  ///useCase
  getIt.registerLazySingleton<GetNowPlayingMoviesUseCase>(
      () => GetNowPlayingMoviesUseCase(getIt()));
  getIt.registerLazySingleton<GetPopularMoviesUseCase>(
      () => GetPopularMoviesUseCase(getIt()));
  getIt.registerLazySingleton<GetTopRatedMoviesUseCase>(
      () => GetTopRatedMoviesUseCase(getIt()));
  getIt.registerLazySingleton<GetMovieDetailsUseCase>(
      () => GetMovieDetailsUseCase(getIt()));
  getIt.registerLazySingleton<GetRecommendationUseCase>(
      () => GetRecommendationUseCase(getIt()));

  /// repository
  getIt.registerLazySingleton<BaseMovieRepo>(() => MoviesRepo(getIt()));

  ///Data source
  getIt.registerLazySingleton<BaseMovieRemoteDataSource>(
      () => MovieRemoteDataSource());
}
