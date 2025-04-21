import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/constants/api_url.dart';
import 'package:movie/core/network/dio_client.dart';
import 'package:movie/service_locator.dart';
abstract class MovieService {
  Future<Either> getTrendingMovies();
  Future<Either> getNowPlayingMovies();
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
}