import 'package:injectable/injectable.dart';
import 'package:karty/core/network/base_handling.dart';
import 'package:karty/features/home_profile/data/data_sources/profile_data_sources.dart';
import 'package:karty/features/home_profile/data/models/request/home_profile_request_model.dart';
import 'package:karty/features/home_profile/data/models/response/home_profile_response_model.dart';
import 'package:karty/features/shared/entity/base_entity.dart';

import '../../domain/repositories/home_profile_repository.dart';

@Injectable(as: HomeProfileRepository)
class HomeProfileRepositoryImp implements HomeProfileRepository {
  HomeProfileRepositoryImp({
    required this.homeProfileRemoteDataSource,
  });

  final HomeProfileRemoteDataSource homeProfileRemoteDataSource;

  Future<CustomResponseType<BaseEntity<HomeProfileModel>>> getProfile(
      {required HomeProfileRequestModel homeProfileRequestModel}) async {
    return await homeProfileRemoteDataSource.getProfile(
        homeProfileRequestModel: homeProfileRequestModel);
  }
}
