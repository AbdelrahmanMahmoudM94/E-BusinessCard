import 'package:karty/core/network/base_handling.dart';
import 'package:karty/features/edit_profile/data/models/request/edit_profile_request_model.dart';
import 'package:karty/features/edit_profile/domain/entities/profile_entity.dart';
import 'package:karty/features/shared/entity/base_entity.dart';

abstract class EditProfileRepository {
  Future<CustomResponseType<BaseEntity<ProfileEntity>>> editProfile(
      {required EditProfileRequestModel editProfileRequestModel});
}
