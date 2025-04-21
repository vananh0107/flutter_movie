import 'package:movie/domain/movie/entities/movie.dart';

abstract class NowPlayingState {}

class NowPlayingMoviesLoading extends NowPlayingState {}

class NowPlayingMoviesLoaded extends NowPlayingState {
  final List<MovieEntity> movies;
  NowPlayingMoviesLoaded({required this.movies});
}

class FailureToLoadNowPlayingMovies extends NowPlayingState {
  final String errorMessage;
  FailureToLoadNowPlayingMovies({required this.errorMessage});
}
