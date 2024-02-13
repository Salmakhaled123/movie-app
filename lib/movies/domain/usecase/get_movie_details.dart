import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/base_usecase.dart';
import 'package:movie_app/movies/domain/entities/movie_details_entity.dart';
import 'package:movie_app/movies/domain/repos/base_movie_repo.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetailsEntity, MovieDetailsParameters> {
  final BaseMovieRepo baseMovieRepo;

  GetMovieDetailsUseCase(this.baseMovieRepo);

  @override
  Future<Either<Failure, MovieDetailsEntity>> call(
      MovieDetailsParameters parameters) async {
    return await baseMovieRepo.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({required this.movieId});
  @override
  List<Object?> get props => [movieId];
}
