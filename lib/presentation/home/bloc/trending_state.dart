import 'package:movie/domain/movie/entities/movie.dart';

abstract class TrendingState {}

class TrendingMoviesLoading extends TrendingState {}

class TrendingMoviesLoaded extends TrendingState {
  final List<MovieEntity> movies;
  TrendingMoviesLoaded({required this.movies});
}

class FailureToLoadTrendingMovies extends TrendingState {
  final String errorMessage;
  FailureToLoadTrendingMovies({required this.errorMessage});
}
