import 'package:injectable/injectable.dart';
import 'package:karty/core/domain/usecase/base_usecase.dart';
import 'package:karty/core/network/base_handling.dart';
import 'package:karty/features/edit_profile/data/models/request/edit_profile_request_model.dart';
import 'package:karty/features/edit_profile/domain/repositories/edit_profile_repository.dart';
import 'package:karty/features/shared/entity/base_entity.dart';

@injectable
class EditProfileUseCase
    implements UseCase<BaseEntity<bool>, EditProfileRequestModel> {
  EditProfileUseCase({required this.editProfileRepository});

  final EditProfileRepository editProfileRepository;

  @override
  Future<CustomResponseType<BaseEntity<bool>>> call(
    EditProfileRequestModel editProfileRequestModel,
  ) async {
    return await editProfileRepository.editProfile(
      editProfileRequestModel: editProfileRequestModel,
    );
  }
}
