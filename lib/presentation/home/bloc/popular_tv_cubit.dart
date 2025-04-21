import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/domain/tv/usercases/tv.dart';
import 'package:movie/presentation/home/bloc/popular_tv_state.dart';
import 'package:movie/service_locator.dart';
class PopularTVCubit extends Cubit<PopularTvState> {
  PopularTVCubit() : super(PopularTVLoading());

  void getPopularTV() async{
    var returnedData = await sl<GetPopularTvUseCase>().call();
    returnedData.fold(
          (error) => emit(FailurePopularTV(errorMessage: error)),
          (data) => emit(PopularTVLoaded(tv: data)),
    );
  }
}