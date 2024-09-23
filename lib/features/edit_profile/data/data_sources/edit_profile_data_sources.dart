import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:karty/core/network/api/network_apis_constants.dart';
import 'package:karty/core/network/base_handling.dart';
import 'package:karty/core/network/network_helper.dart';
import 'package:karty/error/failure.dart';
import 'package:karty/features/edit_profile/data/models/request/edit_profile_request_model.dart';
import 'package:karty/features/edit_profile/data/models/request/edit_social_media_request_model.dart';
import 'package:karty/features/edit_profile/data/models/response/edit_profile_response_model.dart';
import 'package:karty/features/edit_profile/data/models/response/edit_social_media_response_model.dart';
import 'package:karty/features/shared/data/local_data.dart';

abstract class EditProfileRemoteDataSource {
  Future<CustomResponseType<EditProfileResponseModel>> editProfile(
      {required EditProfileRequestModel editProfileRequestModel});

  Future<CustomResponseType<EditSocialMediaResponseModel>> editSocialMedia(
      {required List<EditSocialMediaRequestModel> editSoicalMediaRequestModel});
}

@Injectable(as: EditProfileRemoteDataSource)
class EditProfileDataSourceImpl implements EditProfileRemoteDataSource {
  EditProfileDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<EditProfileResponseModel>> editProfile(
      {required EditProfileRequestModel editProfileRequestModel}) async {
    final String? mobKey = LocalData.getMobKey();

    ({dynamic response, bool success}) result =
        await networkHelper.post(headers: <String, String>{
      "mobKey": "$mobKey",
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Connection": "keep-alive"
    }, path: ApiConstants.editProfile, data: editProfileRequestModel.toJson());

    if (result.success) {
      return right(EditProfileResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  Future<CustomResponseType<EditSocialMediaResponseModel>> editSocialMedia(
      {required List<EditSocialMediaRequestModel>
          editSoicalMediaRequestModel}) async {
    final String? mobKey = LocalData.getMobKey();

    ({dynamic response, bool success}) result = await networkHelper.post(
        headers: <String, String>{
          "mobKey": "$mobKey",
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Connection": "keep-alive"
        },
        path: ApiConstants.editSocialMedia,
        data: <String, Object>{
          "email": "F.Taha@diyarme.com",
          "socialMediaList": editSoicalMediaRequestModel
              .map((EditSocialMediaRequestModel e) => e.toJson())
              .toList()
        });

    if (result.success) {
      return right(EditSocialMediaResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
