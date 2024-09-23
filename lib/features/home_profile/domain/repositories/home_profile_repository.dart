import 'package:karty/core/network/base_handling.dart';
import 'package:karty/features/home_profile/data/models/request/home_profile_request_model.dart';
import 'package:karty/features/home_profile/data/models/response/home_profile_response_model.dart';
import 'package:karty/features/shared/entity/base_entity.dart';

abstract class HomeProfileRepository {
  Future<CustomResponseType<BaseEntity<HomeProfileModel>>> getProfile(
      {required HomeProfileRequestModel homeProfileRequestModel});
}
