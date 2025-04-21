import 'package:movie/domain/movie/entities/movie.dart';

abstract class PopularTvState {}

class PopularTVLoading extends PopularTvState {}

class PopularTVLoaded extends PopularTvState {
  final List<MovieEntity> tv;
  PopularTVLoaded({required this.tv});
}

class FailurePopularTV extends PopularTvState {
  final String errorMessage;
  FailurePopularTV({required this.errorMessage});
}
