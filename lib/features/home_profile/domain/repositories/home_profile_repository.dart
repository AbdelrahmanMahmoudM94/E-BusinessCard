import 'package:karty/core/network/base_handling.dart';
import 'package:karty/features/home_profile/data/models/request/home_profile_request_model.dart';
import 'package:karty/features/home_profile/domain/entities/home_profile_entity.dart';
import 'package:karty/features/shared/entity/base_entity.dart';

abstract class HomeProfileRepository {
  Future<CustomResponseType<BaseEntity<HomeProfileEntity>>> getProfile(
      {required HomeProfileRequestModel homeProfileRequestModel});
}
