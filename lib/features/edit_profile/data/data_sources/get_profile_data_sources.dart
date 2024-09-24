import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:karty/core/network/base_handling.dart';
import 'package:karty/error/failure.dart';
import 'package:karty/features/home_profile/data/models/response/home_profile_response_model.dart';
import 'package:karty/features/shared/data/local_data.dart';

abstract class GetProfileRepositoryImpLocalDataSource {
  Future<CustomResponseType<HomeProfileModel>> getProfile();
}

@Injectable(as: GetProfileRepositoryImpLocalDataSource)
class GetProfileDataSourceImpl
    implements GetProfileRepositoryImpLocalDataSource {
  GetProfileDataSourceImpl();

  @override
  Future<CustomResponseType<HomeProfileModel>> getProfile() async {
    HomeProfileResponseModel? result = LocalData.getHomeProfile();

    if (result != null && result.data?.socialMedia != null) {
      return right(result.data!);
    } else {
      return left(ServerFailure(message: "No Data"));
    }
  }
}
