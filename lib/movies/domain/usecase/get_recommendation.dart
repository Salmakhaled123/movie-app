import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/base_usecase.dart';
import 'package:movie_app/movies/domain/entities/recommendation_entity.dart';
import 'package:movie_app/movies/domain/repos/base_movie_repo.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<RecommendationEntity>, RecommendationParameters> {
  final BaseMovieRepo baseMovieRepo;

  GetRecommendationUseCase(this.baseMovieRepo);
  @override
  Future<Either<Failure, List<RecommendationEntity>>> call(
      RecommendationParameters parameters) async {
    return await baseMovieRepo.getRecommendation(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int id;
  const RecommendationParameters({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
