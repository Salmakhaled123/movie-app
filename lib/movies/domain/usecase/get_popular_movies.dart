import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/base_usecase.dart';
import 'package:movie_app/movies/domain/repos/base_movie_repo.dart';

import '../../../core/error/failure.dart';
import '../entities/movie_entity.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<MovieEntity>, NoParam> {
  final BaseMovieRepo baseMovieRepo;
  GetPopularMoviesUseCase(this.baseMovieRepo);
  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParam parameters) async {
    return await baseMovieRepo.getPopularMovies();
  }
}
