import 'package:karty/core/network/base_handling.dart';
import 'package:karty/features/home_profile/data/models/response/home_profile_response_model.dart';

abstract class GetProfileRepository {
  Future<CustomResponseType<HomeProfileModel>> getProfile();
}
