import 'dart:async';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:karty/core/network/api/network_apis_constants.dart';
import 'package:karty/core/network/exception/exception_handle.dart';
import 'package:karty/core/network/interceptors.dart';
import 'package:karty/error/failure.dart';
import 'package:karty/features/di/dependency_init.dart';
import 'package:karty/features/shared/data/local_data.dart';

@injectable
class NetworkHelper {
  NetworkHelper(this.dio) {
    dio.options.baseUrl = ApiConstants.baseUrl;
    dio.interceptors.add(AuthInterceptor());
    if (kDebugMode) {
      dio.interceptors.add(LoggingInterceptor());
    }
    // _dio.interceptors.add(MyInterceptor());
  }

  Dio dio;

  LocalData localData = LocalData();

  Future<({dynamic response, bool success})> get({
    required String path,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final Response response = await dio.get(
        path,
        queryParameters: queryParams
          ?..removeWhere((String key, value) => value == null),
        options: Options(
          headers: headers,
          receiveTimeout: const Duration(seconds: 60),
          sendTimeout: const Duration(seconds: 60),
        ),
      );
      if (response.statusCode == 200) {
        return (response: response.data, success: true);
      } else {
        return (response: response.data['msg'], success: false);
      }
    } on DioException catch (e) {
      NetError netError = ExceptionHandle.handleException(e);
      return (response: netError.msg, success: false);
    }
  }

  Future<({dynamic response, bool success})> post({
    required String path,
    dynamic data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
    bool disableInterceptors = false,
  }) async {
    try {
      // final Map<String, dynamic> tmpHeaders = _constructTheHeaders(headers);
      Response<dynamic> result;
      // queryParams?.removeWhere((String key, value) => value == null);
      if (data != null) {
        if (data.runtimeType == List<Map<String, dynamic>>) {
          (data as List<Map<String, dynamic>>?)!.map(
            (Map<String, dynamic> e) =>
                e.removeWhere((String key, value) => value == null),
          );
        } else {
          if (data is Map<String, dynamic>) {
            data.removeWhere((String key, value) => value == null);
          }
        }
      }

      final Response response = await dio.post(
        path,
        data: data,
        queryParameters: queryParams
          ?..removeWhere((String key, value) => value == null),
        options: Options(
          headers: headers,
          receiveTimeout: const Duration(seconds: 60),
          sendTimeout: const Duration(seconds: 60),
        ),
      );
      if (response.statusCode == 200) {
        return (response: response.data, success: true);
      } else {
        return (response: response.data['msg'], success: false);
      }
    } on DioException catch (e) {
      NetError netError = ExceptionHandle.handleException(e);
      return (response: netError.msg, success: false);
    }
  }

  Future<Response> put({
    required String path,
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      if (data != null) {
        if (data.runtimeType == List<Map<String, dynamic>>) {
          (data as List<Map<String, dynamic>>?)!.map(
            (Map<String, dynamic> e) =>
                e.removeWhere((String key, value) => value == null),
          );
        } else {
          if (data is Map<String, dynamic>) {
            data.removeWhere((String key, value) => value == null);
          }
        }
      }
      final Response response = await dio.put(
        path,
        data: data,
        options: Options(
          headers: headers,
          receiveTimeout: const Duration(seconds: 60),
          sendTimeout: const Duration(seconds: 60),
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete({
    required String path,
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    final Map<String, dynamic> tmpHeaders = _constructTheHeaders(headers);

    try {
      final Map<String, dynamic> tmpHeaders = _constructTheHeaders(headers);

      final Response response = await dio.delete(
        path,
        data: data,
        options: Options(
          headers: tmpHeaders,
          receiveTimeout: const Duration(seconds: 60),
          sendTimeout: const Duration(seconds: 60),
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Map<String, dynamic> _constructTheHeaders(Map<String, dynamic>? headers) {
    Map<String, dynamic> tmpHeaders = <String, dynamic>{
      'Content-type': 'application/json',
      'Accept': 'text/plain',
      'connection': 'keep-alive',
    };
    if (headers != null) {
      tmpHeaders = headers;
    }
    // final String? mobKey = LocalData.getMobKey();

    // if (mobKey != null) {
    //   tmpHeaders["mobKey"] = "$mobKey";
    // }

    return tmpHeaders;
  }
}

enum Method {
  get,
  post,
  put,
  delete,
}
