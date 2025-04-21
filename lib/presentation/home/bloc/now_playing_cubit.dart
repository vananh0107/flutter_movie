import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/domain/movie/usercases/get_now-playng_movie.dart';
import 'package:movie/presentation/home/bloc/now_playing_state.dart';
import 'package:movie/service_locator.dart';
class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingMoviesLoading());

  void getNowPlayingMovies() async{
    var returnedData = await sl<GetNowPlayingMovies>().call();
    returnedData.fold(
          (error) => emit(FailureToLoadNowPlayingMovies(errorMessage: error)),
          (data) => emit(NowPlayingMoviesLoaded(movies: data)),
    );
  }
}