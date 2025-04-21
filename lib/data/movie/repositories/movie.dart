import 'package:dartz/dartz.dart';
import 'package:movie/common/helper/mapper/movie_mapper.dart';
import 'package:movie/data/movie/source/movie.dart';
import 'package:movie/domain/movie/repositories/movie.dart';
import 'package:movie/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository{
  @override
  Future<Either> getTrendingMovies() async{
    var returnedData = await sl<MovieService>().getTrendingMovies();
    return returnedData.fold(
      (error) => Left(error),
      (data) {
        var movies = List.from(data['content']).map((movie) => MovieMapper.toEntity(movie)).toList();
        return Right(movies);
      },
    );
  }
  @override
  Future<Either> getNowPlayingMovies() async{
    var returnedData = await sl<MovieService>().getNowPlayingMovies();
    return returnedData.fold(
          (error) => Left(error),
          (data) {
        var movies = List.from(data['content']).map((movie) => MovieMapper.toEntity(movie)).toList();
        return Right(movies);
      },
    );
  }
}