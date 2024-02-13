import 'package:equatable/equatable.dart';
import '../../../core/enums.dart';
import '../../domain/entities/movie_entity.dart';

class MovieState extends Equatable {
  final List<MovieEntity> nowPlayingMovies;
  final RequestStates nowPlayingMoviesState;
  final String nowPlayingMoviesMessage;
  final List<MovieEntity> popularMovies;
  final RequestStates popularMoviesState;
  final String popularMoviesMessage;
  final List<MovieEntity> topRatedMovies;
  final RequestStates topRatedMoviesState;
  final String topRatedMoviesMessage;
  const MovieState({
    this.topRatedMovies = const [],
    this.topRatedMoviesState = RequestStates.loading,
    this.topRatedMoviesMessage = '',
    this.nowPlayingMovies = const [],
    this.popularMovies = const [],
    this.popularMoviesState = RequestStates.loading,
    this.popularMoviesMessage = '',
    this.nowPlayingMoviesState = RequestStates.loading,
    this.nowPlayingMoviesMessage = '',
  });

  MovieState copyWith({
    List<MovieEntity>? nowPlayingMovies,
    RequestStates? nowPlayingMoviesState,
    String? nowPlayingMoviesMessage,
    List<MovieEntity>? popularMovies,
    RequestStates? popularMoviesState,
    String? popularMoviesMessage,
    List<MovieEntity>? topRatedMovies,
    RequestStates? topRatedMoviesState,
    String? topRatedMoviesMessage,
  }) {
    return MovieState(
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedMoviesState: topRatedMoviesState ?? this.topRatedMoviesState,
      topRatedMoviesMessage:
          topRatedMoviesMessage ?? this.topRatedMoviesMessage,
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingMoviesState:
          nowPlayingMoviesState ?? this.nowPlayingMoviesState,
      nowPlayingMoviesMessage:
          nowPlayingMoviesMessage ?? this.nowPlayingMoviesMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMoviesState: popularMoviesState ?? this.popularMoviesState,
      popularMoviesMessage: popularMoviesMessage ?? this.popularMoviesMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingMoviesState,
        nowPlayingMoviesMessage,
        popularMovies,
        popularMoviesState,
        popularMoviesMessage,
        topRatedMovies,
        topRatedMoviesState,
        topRatedMoviesMessage
      ];
}
