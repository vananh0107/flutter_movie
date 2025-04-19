
import 'package:dartz/dartz.dart';
import 'package:movie/core/usercase/usercase.dart';
import 'package:movie/data/auth/models/signup_req_params.dart';
import 'package:movie/domain/auth/repositories/auth.dart';
import 'package:movie/service_locator.dart';

class SignupUserCase extends UseCase<Either, SignupParams>{
  @override
  Future<Either> call({SignupParams? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }
}