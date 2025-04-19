import 'package:get_it/get_it.dart';
import 'package:movie/core/network/dio_client.dart';
import 'package:movie/data/auth/repositories/auth.dart';
import 'package:movie/data/auth/source/auth_api_service.dart';
import 'package:movie/domain/auth/auth/usercases/signup.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  // DioClient
  sl.registerLazySingleton<DioClient>(() => DioClient());
  //Serivce
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  //Repository
  sl.registerSingleton<AuthRepositoryImpl>(AuthRepositoryImpl());
  //UserCase
  sl.registerSingleton<SignupUserCase>(SignupUserCase());
}