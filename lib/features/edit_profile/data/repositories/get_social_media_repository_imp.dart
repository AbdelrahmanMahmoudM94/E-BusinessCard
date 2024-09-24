import 'package:injectable/injectable.dart';
import 'package:karty/core/network/base_handling.dart';
import 'package:karty/features/edit_profile/data/data_sources/get_profile_data_sources.dart';
import 'package:karty/features/edit_profile/domain/repositories/get_profile_repository.dart';
import 'package:karty/features/home_profile/data/models/response/home_profile_response_model.dart';

@Injectable(as: GetProfileRepository)
class GetProfileRepositoryImp implements GetProfileRepository {
  GetProfileRepositoryImp({
    required this.getProfileaRepositoryImpLocalDataSource,
  });

  final GetProfileRepositoryImpLocalDataSource
      getProfileaRepositoryImpLocalDataSource;

  Future<CustomResponseType<HomeProfileModel>> getProfile() async {
    return await getProfileaRepositoryImpLocalDataSource.getProfile();
  }
}
