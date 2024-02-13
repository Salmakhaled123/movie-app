part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final String movieDetailsMessage;
  final MovieDetailsEntity? movieDetailsEntity;
  final RequestStates movieDetailsState;
  final String recommendationMessage;
  final List<RecommendationEntity>? recommendationEntity;
  final RequestStates recommendationState;

  const MovieDetailsState({
    this.recommendationState = RequestStates.loading,
    this.recommendationMessage = '',
    this.recommendationEntity = const [],
    this.movieDetailsMessage = '',
    this.movieDetailsEntity,
    this.movieDetailsState = RequestStates.loading,
  });
  MovieDetailsState copyWith({
    String? movieDetailsMessage,
    MovieDetailsEntity? movieDetailsEntity,
    RequestStates? movieDetailsState,
    String? recommendationMessage,
    List<RecommendationEntity>? recommendationEntity,
    RequestStates? recommendationState,
  }) {
    return MovieDetailsState(
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      movieDetailsEntity: movieDetailsEntity ?? this.movieDetailsEntity,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      recommendationEntity: recommendationEntity ?? this.recommendationEntity,
      recommendationMessage:
          recommendationMessage ?? this.recommendationMessage,
      recommendationState: recommendationState ?? this.recommendationState,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        movieDetailsMessage,
        movieDetailsEntity,
        movieDetailsState,
        recommendationMessage,
        recommendationEntity,
        recommendationState
      ];
}
