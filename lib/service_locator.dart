import 'package:get_it/get_it.dart';
import 'package:movie/core/network/dio_client.dart';
import 'package:movie/data/auth/repositories/auth.dart';
import 'package:movie/data/auth/source/auth_api_service.dart';
import 'package:movie/data/movie/repositories/movie.dart';
import 'package:movie/data/movie/source/movie.dart';
import 'package:movie/data/tv/repositories/tv.dart';
import 'package:movie/data/tv/source/tv.dart';
import 'package:movie/domain/auth/auth/usercases/is_logged_in.dart';
import 'package:movie/domain/auth/auth/usercases/signin.dart';
import 'package:movie/domain/auth/auth/usercases/signup.dart';
import 'package:movie/domain/auth/repositories/auth.dart';
import 'package:movie/domain/movie/repositories/movie.dart';
import 'package:movie/domain/movie/usercases/get_now-playng_movie.dart';
import 'package:movie/domain/movie/usercases/get_trending_movie.dart';
import 'package:movie/domain/tv/repositories/tv.dart';
import 'package:movie/domain/tv/usercases/tv.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  // DioClient
  sl.registerLazySingleton<DioClient>(() => DioClient());
  //Serivce
  sl.registerSingleton<AuthService>(AuthApiServiceImpl());
  sl.registerSingleton<MovieService>(MovieApiServiceImpl());
  sl.registerSingleton<TVService>(TVServiceImpl());
  //Repository
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());
  sl.registerSingleton<TVRepository>(TVRepositoryImpl());
  //UserCase
  sl.registerSingleton<SignupUserCase>(SignupUserCase());
  sl.registerSingleton<SigninUserCase>(SigninUserCase());
  sl.registerSingleton<isLoggedInUsercase>(isLoggedInUsercase());
  sl.registerSingleton<GetTrendingMovieUseCase>(GetTrendingMovieUseCase());
  sl.registerSingleton<GetNowPlayingMovies>(GetNowPlayingMovies());
  sl.registerSingleton<GetPopularTvUseCase>(GetPopularTvUseCase());
}