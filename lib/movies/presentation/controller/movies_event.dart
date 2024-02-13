import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();
  @override
  List<Object> get props => [];
}

class GetNowPLayingMoviesEvent extends MoviesEvent {}

class GetPopularMoviesEvent extends MoviesEvent {}

class GetTopRatedMoviesEvent extends MoviesEvent {}
