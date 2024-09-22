import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:karty/core/network/api/network_apis_constants.dart';
import 'package:karty/core/network/base_handling.dart';
import 'package:karty/core/network/exception/error_status.dart';
import 'package:karty/error/failure.dart';
import 'package:karty/features/common/constants.dart';
import 'package:karty/features/common/helper/encrypt_data.dart';
import 'package:karty/features/common/helper/view_toolbox.dart';
import 'package:karty/features/di/dependency_init.dart';
import 'package:karty/features/login/data/repositories/login_repository_imp.dart';
import 'package:karty/features/login/domain/repositories/login_repository.dart';
import 'package:karty/features/shared/common_utils/log_utils.dart';
import 'package:karty/features/shared/data/local_data.dart';

///Header management interceptor
class AuthInterceptor extends Interceptor {
  Dio _dio = getIt<Dio>();
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String? mobKey = LocalData.getMobKey();
    Log.d("mobKey:$mobKey" ?? "");
    if (mobKey != null) {
      options.headers["mobKey"] = "$mobKey";
    }
    //  options.headers["Content-Type"] = "application/json";
    options.headers["Accept"] = "application/json";
    options.headers["Connection"] = "keep-alive";

    // if (options.headers["x-api-key"] == null) {
    //   options.headers["mobKey"] =
    //       "D9GVHLI49G+ZNuv5ScCE3HKfaasvzX0bR7TAqQzuXeO3hRlZd2+d3KF6o8fiLevyKTk3zHkScdT+3wB1YdByN3kxoxSleSRdEX6fPKTcLiJFhWw36YkoRsCbqFzwkZl4XqS6cZut0ujISvFLixwG4pKkZQOo/Sz9tscKl8RmLKZVgIrtqlR3cH5AHFtro9ik+VYU7HytQQ8Bfvs2x9kD3uQX3JaZjKa+Gk5TzyNmLqxm+zLK5Tu6zWz5jGyJit/Eav+SMqPHR2p+Ayt2zcafo+hQOhgADbgsHfzx62PQeqAr4XxriPIgkqxdUPPi77SyQN0CADCE83M=";
    // }
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 429) {
      return handler.resolve(await _dio.fetch(err.requestOptions));
    } else if ((err.response == null) ||
        (err.response?.data == "") ||
        err.response?.statusCode == 401) {
      try {
        String? token = await CustomEncrypt.encryptData(
            "f.taha@diyarme.com", Constants.rsaPublicKey);
        String mobKey = await getMobKey(token: token!);
        if (mobKey != "") {
          log(mobKey);
          err.requestOptions.headers["mobKey"] = mobKey;

          await LocalData.setMobKey(mobKey);

          handler.resolve(await _dio.fetch(err.requestOptions));
        } else {
          ViewsToolbox.dismissLoading();
          handler.reject(err);
          return;
        }
      } catch (e) {
        ViewsToolbox.dismissLoading();
      }
    }
    ViewsToolbox.dismissLoading();
    handler.next(err);
  }

  Future<String> getMobKey({required String token}) async {
    Dio _dio = Dio();
    try {
      Response result = await _dio.post(
        ApiConstants.getMobKey,
        data: jsonEncode(token),
        options: Options(headers: <String, dynamic>{
          "x-api-key": "AEEB6FC5-4B05-4175-B945-BA85180A4650"
        }),
      );

      if (result.statusCode == 200) {
        return result.data['key'];
      } else {
        return "";
      }
    } on DioException catch (e) {
      return "";
    }
  }
}

///Log interceptor settings
class LoggingInterceptor extends Interceptor {
  DateTime? startTime;
  DateTime? endTime;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    startTime = DateTime.now();
    Log.d("----------Request Start---------");
    Log.i(" path :${options.path}");

    // if(options.path.contains(Api.getCountriesListApiCall)){
    //   options.baseUrl=Api.nartaqiBaseUrl;
    // }

    ///print full path request
    if (options.queryParameters.isEmpty) {
      if (options.path.contains(options.baseUrl)) {
        Log.i("RequestUrl:${options.path}");
      } else {
        Log.i("RequestUrl:${options.baseUrl}${options.path}");
      }
    } else {
      ///If queryParameters is not empty, splice into a complete URl
      Log.i(
        "RequestUrl:${options.baseUrl}${options.path}?${Transformer.urlEncodeMap(options.queryParameters)}",
      );
    }

    Log.w("RequestMethod:${options.method}");
    Log.w("RequestHeaders:${options.headers}");
    Log.w("RequestContentType:${options.contentType}");
    Log.w("RequestDataOptions:${options.data}");

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    endTime = DateTime.now();
    //Request duration
    final int duration = endTime!.difference(startTime!).inMilliseconds;
    Log.i("----------End Request $duration millisecond---------");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Log.e("--------------Error-----------");
    handler.reject(err);
  }
}

//parsing data
class AdapterInterceptor extends Interceptor {
  static const String MSG = "msg";
  static const String SLASH = "\"";
  static const String MESSAGE = "message";
  static const String ERROR = "validateError";

  static const String DEFAULT = "\"NOT_FOUND\"";
  static const String NOT_FOUND = "Some Thing Wrong Happened";

  static const String FAILURE_FORMAT = "{\"code\":%d,\"message\":\"%s\"}";
  static const String SUCCESS_FORMAT =
      "{\"code\":0,\"data\":%s,\"message\":\"\"}";

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final Response mResponse = adapterData(response);
    return super.onResponse(mResponse, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      adapterData(err.response!);
    }
    return super.onError(err, handler);
  }

  Response adapterData(Response response) {
    // String result;
    // String content = response.data == null ? "" : response.data.toString();
    // if (response.statusCode == ErrorStatus.SUCCESS) {
    //   if (content.isEmpty) {
    //     content = DEFAULT;
    //   }
    //   result = sprintf(SUCCESS_FORMAT, [content]);
    //   response.statusCode = ErrorStatus.SUCCESS;
    // } else if (response.statusCode == ErrorStatus.errorValidtion) {
    //   result = sprintf(SUCCESS_FORMAT, [response.statusCode, content]);
    //   response.statusCode = ErrorStatus.errorValidtion;
    // } else {
    //   result = sprintf(FAILURE_FORMAT, [response.statusCode, NOT_FOUND]);
    //   response.statusCode = ErrorStatus.SUCCESS;
    // }
    if (response.statusCode == ErrorStatus.SUCCESS) {
      Log.d("ResponseCode:${response.statusCode}");
      Log.d("response:${response.data}");
    } else {
      Log.e("ResponseCode:${response.statusCode}");
      Log.d("response:${response.data}");
    }
    // Log.json(result);
    // response.data = result;
    return response;
  }
}
