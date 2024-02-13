import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/base_usecase.dart';
import 'package:movie_app/movies/domain/entities/movie_entity.dart';

import '../../../core/error/failure.dart';
import '../repos/base_movie_repo.dart';

class GetNowPlayingMoviesUseCase
    extends BaseUseCase<List<MovieEntity>, NoParam> {
  final BaseMovieRepo baseMovieRepo;
  GetNowPlayingMoviesUseCase(this.baseMovieRepo);
  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParam parameters) async {
    return await baseMovieRepo.getNowPlayingMovies();
  }
}
