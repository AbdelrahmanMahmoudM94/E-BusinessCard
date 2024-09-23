import 'package:injectable/injectable.dart';
import 'package:karty/core/network/base_handling.dart';
import 'package:karty/features/edit_profile/data/data_sources/edit_profile_data_sources.dart';
import 'package:karty/features/edit_profile/data/models/request/edit_profile_request_model.dart';
import 'package:karty/features/edit_profile/data/models/request/edit_social_media_request_model.dart';
import 'package:karty/features/edit_profile/data/models/response/edit_profile_response_model.dart';
import 'package:karty/features/shared/entity/base_entity.dart';

import '../../domain/repositories/edit_profile_repository.dart';

@Injectable(as: EditProfileRepository)
class EditProfileRepositoryImp implements EditProfileRepository {
  EditProfileRepositoryImp({
    required this.editProfileRemoteDataSource,
  });

  final EditProfileRemoteDataSource editProfileRemoteDataSource;

  Future<CustomResponseType<EditProfileResponseModel>> editProfile(
      {required EditProfileRequestModel editProfileRequestModel}) async {
    return await editProfileRemoteDataSource.editProfile(
        editProfileRequestModel: editProfileRequestModel);
  }

  @override
  Future<CustomResponseType<BaseEntity<bool>>> editSocialMedia(
      {required List<EditSocialMediaRequestModel>
          editSoicalMediaRequestModel}) async {
    return await editProfileRemoteDataSource.editSocialMedia(
        editSoicalMediaRequestModel: editSoicalMediaRequestModel);
  }
}
