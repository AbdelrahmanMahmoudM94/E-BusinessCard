import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:karty/core/network/api/network_apis_constants.dart';
import 'package:karty/core/network/base_handling.dart';
import 'package:karty/core/network/network_helper.dart';
import 'package:karty/error/failure.dart';
import 'package:karty/features/edit_profile/data/models/request/edit_profile_request_model.dart';
import 'package:karty/features/edit_profile/data/models/response/profile_response_model.dart';

abstract class EditProfileRemoteDataSource {
  Future<CustomResponseType<ProfileResponseModel>> editProfile(
      {required EditProfileRequestModel editProfileRequestModel});
}

@Injectable(as: EditProfileRemoteDataSource)
class EditProfileDataSourceImpl implements EditProfileRemoteDataSource {
  EditProfileDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<ProfileResponseModel>> editProfile(
      {required EditProfileRequestModel editProfileRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper.post(
        path: ApiConstants.editProfile, data: editProfileRequestModel.toJson());

    if (result.success) {
      return right(ProfileResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
