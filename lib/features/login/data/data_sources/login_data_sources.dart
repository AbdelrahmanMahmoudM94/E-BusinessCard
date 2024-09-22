import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:karty/core/network/api/network_apis_constants.dart';
import 'package:karty/core/network/network_helper.dart';
import 'package:karty/core/network/base_handling.dart';
import 'package:karty/error/failure.dart';
import 'package:karty/features/login/data/models/response/app_config_response_model.dart';
import 'package:karty/features/shared/entity/base_entity.dart';
 
abstract class LoginRemoteDataSource {
     Future<CustomResponseType<AppConfigResponseModel>> getAppConfig({ 
   required String email });
}

@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  LoginRemoteDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

    @override
  Future<CustomResponseType<AppConfigResponseModel>> getAppConfig({required String email}) async {
    ({dynamic response, bool success}) result =
        await networkHelper.post(path: ApiConstants.getAppConfig,data:{"email":email});

    if (result.success) {
      return right(AppConfigResponseModel.fromJson( result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
