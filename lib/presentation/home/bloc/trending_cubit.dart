import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/domain/movie/usercases/get_trending_movie.dart';
import 'package:movie/presentation/home/bloc/trending_state.dart';
import 'package:movie/service_locator.dart';
class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingMoviesLoading());

  void getTrendingMovies() async{
    var returnedData = await sl<GetTrendingMovieUseCase>().call();
    returnedData.fold(
      (error) => emit(FailureToLoadTrendingMovies(errorMessage: error)),
      (data) => emit(TrendingMoviesLoaded(movies: data)),
    );
  }
}