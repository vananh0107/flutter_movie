import 'dart:io';

import 'package:dio/dio.dart';
import 'package:movie/core/constants/api_url.dart';
import 'interceptors.dart';

class DioClient {

  late final Dio _dio;
  DioClient(): _dio = Dio(
    BaseOptions(
      baseUrl: ApiUrl.baseURL,
      headers:{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      responseType: ResponseType.json,
      sendTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  )..interceptors.addAll([AuthorizationInterceptor(), LoggerInterceptor()]);

  // Get method
  Future<Response> get(
      String url,
      {Map<String, dynamic>? queryParameters,
        Options? option,
        CancelToken? cancelToken,
        ProgressCallback? progressCallback
      }) async {
    try {
      final response =  await _dio.get(
        url,
        queryParameters: queryParameters,
        options: option,
        cancelToken: cancelToken,
        onReceiveProgress: progressCallback,
      );
      return response;
    } on DioException catch (e) {
      rethrow;
    }
  }

  // Post method
  Future<Response> post(
      String url,
      {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      rethrow;
    }
  }

  //Put method
  Future<Response> put(
      String url,
      {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      rethrow;
    }
  }

  //Delete method
  Future<Response> delete(
      String url,
      {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
      }) async {
    try {
      final response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      rethrow;
    }
  }
}