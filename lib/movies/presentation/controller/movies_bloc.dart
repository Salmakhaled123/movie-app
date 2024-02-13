import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/enums.dart';
import 'package:movie_app/core/usecase/base_usecase.dart';
import 'package:movie_app/movies/domain/usecase/get_now_playing_movies.dart';
import 'package:movie_app/movies/presentation/controller/movies_event.dart';
import 'package:movie_app/movies/presentation/controller/movies_state.dart';

import '../../domain/usecase/get_popular_movies.dart';
import '../../domain/usecase/get_top_rated_movies.dart';

class MoviesBloc extends Bloc<MoviesEvent, MovieState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase popularMoviesUseCase;
  final GetTopRatedMoviesUseCase topRatedMoviesUseCase;
  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.popularMoviesUseCase,
    this.topRatedMoviesUseCase,
  ) : super(const MovieState()) {
    FutureOr<void> getNowPlaying(GetNowPLayingMoviesEvent event, emit) async {
      final result = await getNowPlayingMoviesUseCase(const NoParam());
      result.fold((l) {
        emit(state.copyWith(
          nowPlayingMoviesMessage: l.errorMessage,
          nowPlayingMoviesState: RequestStates.error,
        ));
      }, (r) {
        emit(state.copyWith(
          nowPlayingMoviesState: RequestStates.loaded,
          nowPlayingMovies: r,
        ));
      });
    }

    FutureOr<void> getPopularMovies(GetPopularMoviesEvent event, emit) async {
      final result = await popularMoviesUseCase(const NoParam());
      result.fold((l) {
        emit(state.copyWith(
          popularMoviesMessage: l.errorMessage,
          popularMoviesState: RequestStates.error,
        ));
      }, (r) {
        emit(state.copyWith(
          popularMoviesState: RequestStates.loaded,
          popularMovies: r,
        ));
      });
    }

    FutureOr<void> getTopRated(GetTopRatedMoviesEvent event, emit) async {
      final result = await topRatedMoviesUseCase(const NoParam());
      result.fold((l) {
        emit(state.copyWith(
          topRatedMoviesMessage: l.errorMessage,
          topRatedMoviesState: RequestStates.error,
        ));
      }, (r) {
        emit(state.copyWith(
          topRatedMoviesState: RequestStates.loaded,
          topRatedMovies: r,
        ));
      });
    }

    on<GetNowPLayingMoviesEvent>(getNowPlaying);
    on<GetPopularMoviesEvent>(getPopularMovies);
    on<GetTopRatedMoviesEvent>(getTopRated);
  }
}
