import 'package:dartz/dartz.dart';
import 'package:movie/core/usercase/usercase.dart';
import 'package:movie/data/auth/models/signin_req_params.dart';
import 'package:movie/data/auth/models/signup_req_params.dart';
import 'package:movie/domain/auth/repositories/auth.dart';
import 'package:movie/service_locator.dart';

class SigninUserCase extends UseCase<Either, SigninParams>{
  @override
  Future<Either> call({SigninParams? params}) async {
    return await sl<AuthRepository>().signin(params!);
  }
}