import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/constants/api_url.dart';
import 'package:movie/core/network/dio_client.dart';
import 'package:movie/service_locator.dart';
abstract class TVService {
  Future<Either> getPopularTV();
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
}