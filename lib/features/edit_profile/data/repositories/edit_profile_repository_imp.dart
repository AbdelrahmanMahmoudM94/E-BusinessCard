import 'package:injectable/injectable.dart';
import 'package:karty/core/network/base_handling.dart';
import 'package:karty/features/edit_profile/data/data_sources/edit_profile_data_sources.dart';
import 'package:karty/features/edit_profile/data/models/request/edit_profile_request_model.dart';
import 'package:karty/features/edit_profile/data/models/response/profile_response_model.dart';

import '../../domain/repositories/edit_profile_repository.dart';

@Injectable(as: EditProfileRepository)
class EditProfileRepositoryImp implements EditProfileRepository {
  EditProfileRepositoryImp({
    required this.editProfileRemoteDataSource,
  });

  final EditProfileRemoteDataSource editProfileRemoteDataSource;

  Future<CustomResponseType<ProfileResponseModel>> editProfile(
      {required EditProfileRequestModel editProfileRequestModel}) async {
    return editProfileRemoteDataSource.editProfile(
        editProfileRequestModel: editProfileRequestModel);
  }
}
