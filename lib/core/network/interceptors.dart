
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
class LoggerInterceptor extends Interceptor{
  final Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 0,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  @override
  void onError(
      DioException error,
      ErrorInterceptorHandler handler
   ) {
    final options = error.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';
    logger.e('${options.method} request ==> $requestPath');
    logger.d('Error type: ${error.error} \n'
            'Error message: ${error.message}');
    handler.next(error);
  }
  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
  ) {
    final requestPath = '${options.baseUrl}${options.path}';
    logger.i('${options.method} request ==> $requestPath');
    handler.next(options);
  }
  @override
  void onResponse(
      Response response,
      ResponseInterceptorHandler handler,
  ) {
    final requestPath = '${response.requestOptions.baseUrl}${response.requestOptions.path}';
    logger.d('Response: ${response.data}');
    logger.i('${response.requestOptions.method} request ==> $requestPath');
    handler.next(response);
  }
}