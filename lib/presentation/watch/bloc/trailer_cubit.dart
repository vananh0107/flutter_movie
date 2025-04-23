import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/entities/trailer.dart';
import 'package:movie/domain/movie/usercases/get_movie_trailer.dart';
import 'package:movie/presentation/watch/bloc/trailer_state.dart';
import 'package:movie/service_locator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerCubit extends Cubit<TrailerState>{

  TrailerCubit() : super(TrailerLoading());

  void getMovieTrailer(int movieId) async{
    var returnedData = await sl<GetMovieTrailerUseCase>().call(
      params: movieId
    );
    returnedData.fold(
      (error) {
        emit(LoadedFailureTrailer(
            errorMessage: error
        ));
      },
      (data) async{
        TrailerEntity trailerEntity = data;
        YoutubePlayerController _controller = YoutubePlayerController(
            initialVideoId: trailerEntity.key!,
            flags: const YoutubePlayerFlags(
              autoPlay: false,
              mute: false,
            )
        );
        emit(TrailerLoaded(youtubePlayerController: _controller));
      }
    );
  }
}