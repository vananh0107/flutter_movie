import 'package:dartz/dartz.dart';
import 'package:movie/data/auth/models/signup_req_params.dart';

abstract class AuthRepository{
  Future<Either> signup(SignupParams params);
}