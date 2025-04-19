import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie/core/constants/api_url.dart';
import 'package:movie/core/network/dio_client.dart';
import 'package:movie/data/auth/models/signup_req_params.dart';
import 'package:movie/service_locator.dart';

abstract class AuthApiService {
  Future<Either> signup(SignupParams params);
}

class AuthApiServiceImpl extends AuthApiService {
  @override
  Future<Either> signup(SignupParams params) async {
    try{
      var respone= await sl<DioClient>().post(
        ApiUrl.signup,
        data: params.toMap(),
      );
      return Right(respone.data);
    } on DioException catch(e){
      return Left(e.response!.data['message']);
    }
  }
}