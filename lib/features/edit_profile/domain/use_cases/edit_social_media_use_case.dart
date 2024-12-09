import 'package:injectable/injectable.dart';
import 'package:karty/core/domain/usecase/base_usecase.dart';
import 'package:karty/core/network/base_handling.dart';
import 'package:karty/features/edit_profile/domain/repositories/edit_profile_repository.dart';
import 'package:karty/features/shared/entity/base_entity.dart';

import '../../data/models/request/edit_social_media_request_model.dart';

@injectable
class EditSocialMediaUseCase
    implements UseCase<BaseEntity<bool>, List<EditSocialMediaRequestModel>> {
  EditSocialMediaUseCase({required this.editProfileRepository});
  final EditProfileRepository editProfileRepository;

  @override
  Future<CustomResponseType<BaseEntity<bool>>> call(
    List<EditSocialMediaRequestModel> editSoicalMediaRequestModel,
  ) async {
    return await editProfileRepository.editSocialMedia(
      editSoicalMediaRequestModel: editSoicalMediaRequestModel,
    );
  }
}
