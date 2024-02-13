import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/enums.dart';
import 'package:movie_app/movies/domain/entities/movie_details_entity.dart';

import '../../domain/entities/recommendation_entity.dart';
import '../../domain/usecase/get_movie_details.dart';
import '../../domain/usecase/get_recommendation.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;
  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetRecommendationEvent>(_getRecommendation);
  }
  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(movieId: event.id));
    result.fold(
        (l) => emit(state.copyWith(
              movieDetailsState: RequestStates.error,
              movieDetailsMessage: l.errorMessage,
            )),
        (r) => emit(state.copyWith(
              movieDetailsState: RequestStates.loaded,
              movieDetailsEntity: r,
            )));
  }

  FutureOr<void> _getRecommendation(
      GetRecommendationEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getRecommendationUseCase(RecommendationParameters(id: event.id));
    result.fold(
        (l) => emit(state.copyWith(
              recommendationState: RequestStates.error,
              recommendationMessage: l.errorMessage,
            )),
        (r) => emit(state.copyWith(
              recommendationState: RequestStates.loaded,
              recommendationEntity: r,
            )));
  }
}
