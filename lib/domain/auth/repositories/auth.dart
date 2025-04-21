import 'package:dartz/dartz.dart';
import 'package:movie/data/auth/models/signin_req_params.dart';
import 'package:movie/data/auth/models/signup_req_params.dart';

abstract class AuthRepository{
  Future<Either> signup(SignupParams params);
  Future<Either> signin(SigninParams params);
  Future<bool> isLoggedIn();
}