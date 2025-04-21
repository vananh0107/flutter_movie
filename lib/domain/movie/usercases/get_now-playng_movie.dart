import 'package:dartz/dartz.dart';
import 'package:movie/core/usercase/usercase.dart';
import 'package:movie/domain/movie/repositories/movie.dart';
import 'package:movie/service_locator.dart';
class GetNowPlayingMovies extends UseCase<Either, dynamic>{
  @override
  Future<Either> call({params}) async {
    return await sl<MovieRepository>().getNowPlayingMovies();
  }
}