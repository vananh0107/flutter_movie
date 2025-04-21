import 'package:dartz/dartz.dart';
import 'package:movie/data/auth/models/signin_req_params.dart';
import 'package:movie/data/auth/models/signup_req_params.dart';
import 'package:movie/data/auth/source/auth_api_service.dart';
import 'package:movie/domain/auth/repositories/auth.dart';
import 'package:movie/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl extends AuthRepository{

  @override
  Future<Either> signup(SignupParams params) async {
    var data = await sl<AuthService>().signup(params);
    return data.fold(
        (error) {
          return Left(error);
        },
        (data) async {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('token', data['user']['token']);
          return Right(data);
        }
    );
  }

  @override
  Future<Either> signin(SigninParams params) async {
    return await sl<AuthService>().signin(params);
  }

  @override
  Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if(token != null){
      return true;
    }else{
      return false;
    }
  }
}