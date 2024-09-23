import 'package:karty/core/network/base_handling.dart';
import 'package:karty/features/edit_profile/data/models/request/edit_profile_request_model.dart';
import 'package:karty/features/edit_profile/data/models/request/edit_social_media_request_model.dart';
import 'package:karty/features/shared/entity/base_entity.dart';

abstract class EditProfileRepository {
  Future<CustomResponseType<BaseEntity<bool>>> editProfile(
      {required EditProfileRequestModel editProfileRequestModel});

  Future<CustomResponseType<BaseEntity<bool>>> editSocialMedia(
      {required List<EditSocialMediaRequestModel> editSoicalMediaRequestModel});
}
