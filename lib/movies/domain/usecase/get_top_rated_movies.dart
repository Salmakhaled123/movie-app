import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/base_usecase.dart';

import '../../../core/error/failure.dart';
import '../entities/movie_entity.dart';
import '../repos/base_movie_repo.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<MovieEntity>, NoParam> {
  final BaseMovieRepo baseMovieRepo;
  GetTopRatedMoviesUseCase(this.baseMovieRepo);
  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParam parameters) async {
    return await baseMovieRepo.getTopRatedMovies();
  }
}
