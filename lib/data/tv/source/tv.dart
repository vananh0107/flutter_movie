import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/constants/api_url.dart';
import 'package:movie/core/network/dio_client.dart';
import 'package:movie/service_locator.dart';
abstract class TVService {
  Future<Either> getPopularTV();
  Future<Either> getRecommendationTVs(int tvId);
  Future<Either> getSimilarTVs(int tvId);
  Future<Either> getKeywords(int tvId);

}

class TVServiceImpl extends TVService{

  @override
  Future<Either> getPopularTV() async{
    try{
      var respone = await sl<DioClient>().get(
          ApiUrl.popularTV);
      return Right(respone.data);
    } on DioException catch(e){
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getRecommendationTVs(int tvId) async{
    try{
      var respone = await sl<DioClient>().get(
          '${ApiUrl.tv}$tvId/recommendations');
      return Right(respone.data);
    } on DioException catch(e){
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getSimilarTVs(int tvId) async{
    try{
      var respone = await sl<DioClient>().get(
          '${ApiUrl.tv}$tvId/similar');
      return Right(respone.data);
    } on DioException catch(e){
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getKeywords(int tvId) async{
    try{
      var respone = await sl<DioClient>().get(
          '${ApiUrl.tv}$tvId/keywords');
      return Right(respone.data);
    } on DioException catch(e){
      return Left(e.response!.data['message']);
    }
  }
}