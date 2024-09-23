import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:karty/core/network/api/network_apis_constants.dart';
import 'package:karty/core/network/base_handling.dart';
import 'package:karty/core/network/network_helper.dart';
import 'package:karty/error/failure.dart';
import 'package:karty/features/home_profile/data/models/request/home_profile_request_model.dart';
import 'package:karty/features/home_profile/data/models/response/home_profile_response_model.dart';
import 'package:karty/features/shared/data/local_data.dart';

abstract class HomeProfileRemoteDataSource {
  Future<CustomResponseType<HomeProfileResponseModel>> getProfile(
      {required HomeProfileRequestModel homeProfileRequestModel});
}

@Injectable(as: HomeProfileRemoteDataSource)
class ProfileDataSourceImpl implements HomeProfileRemoteDataSource {
  ProfileDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<HomeProfileResponseModel>> getProfile(
      {required HomeProfileRequestModel homeProfileRequestModel}) async {
    final String? mobKey = LocalData.getMobKey();

    ({dynamic response, bool success}) result = await networkHelper.post(
        headers: <String, String>{
          "mobKey": "$mobKey",
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Connection": "keep-alive"
        },
        path: ApiConstants.profile,
        data: <String, String>{
          "email": homeProfileRequestModel.email ?? "",
          "lang": homeProfileRequestModel.lang ?? "a"
        });

    if (result.success) {
      return right(HomeProfileResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
