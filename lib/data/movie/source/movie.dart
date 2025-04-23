import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/constants/api_url.dart';
import 'package:movie/core/network/dio_client.dart';
import 'package:movie/service_locator.dart';
abstract class MovieService {
  Future<Either> getTrendingMovies();

  Future<Either> getNowPlayingMovies();

  Future<Either> getMovieTrailer(int movieId);

  Future<Either> getRecommendationMovies(int movieId);
  
  Future<Either> getSimilarMovies(int movieId);
}

class MovieApiServiceImpl extends MovieService {
  @override
  Future<Either> getTrendingMovies() async {
    try{
       var respone = await sl<DioClient>().get(
        ApiUrl.trendingMovies);
       return Right(respone.data);
    } on DioException catch(e){
      return Left(e.response!.data['message']);
    }
  }
  @override
  Future<Either> getNowPlayingMovies() async {
    try{
      var respone = await sl<DioClient>().get(
          ApiUrl.nowPlayingMovies);
      return Right(respone.data);
    } on DioException catch(e){
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getMovieTrailer(int movieId) async{
    try{
      var respone = await sl<DioClient>().get(
          ApiUrl.movie+'$movieId/trailer');
      return Right(respone.data);
    } on DioException catch(e){
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getRecommendationMovies(int movieId) async{
    try{
      var respone = await sl<DioClient>().get(
          ApiUrl.movie+'$movieId/recommendation');
      return Right(respone.data);
    } on DioException catch(e){
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getSimilarMovies(int movieId) async{
    try{
      var respone = await sl<DioClient>().get(
          ApiUrl.movie+'$movieId/similar');
      return Right(respone.data);
    } on DioException catch(e){
      return Left(e.response!.data['message']);
    }
  }
}