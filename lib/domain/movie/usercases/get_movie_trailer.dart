import 'package:dartz/dartz.dart';
import 'package:movie/core/usercase/usercase.dart';
import 'package:movie/domain/movie/repositories/movie.dart';
import 'package:movie/service_locator.dart';
class GetMovieTrailerUseCase extends UseCase<Either, int>{
  @override
  Future<Either> call({int ? params}) async {
    return await sl<MovieRepository>().getMovieTrailer(params!);
  }
}