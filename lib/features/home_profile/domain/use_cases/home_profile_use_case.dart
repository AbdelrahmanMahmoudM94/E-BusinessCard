import 'package:injectable/injectable.dart';
import 'package:karty/core/domain/usecase/base_usecase.dart';
import 'package:karty/core/network/base_handling.dart';
import 'package:karty/features/home_profile/data/models/request/home_profile_request_model.dart';
import 'package:karty/features/home_profile/domain/repositories/home_profile_repository.dart';
import 'package:karty/features/shared/entity/base_entity.dart';

import '../entities/home_profile_entity.dart';

@injectable
class HomeProfileUseCase
    implements UseCase<BaseEntity<HomeProfileEntity>, HomeProfileRequestModel> {
  HomeProfileUseCase({required this.homeProfileRepository});

  final HomeProfileRepository homeProfileRepository;

  @override
  Future<CustomResponseType<BaseEntity<HomeProfileEntity>>> call(
      HomeProfileRequestModel homeProfileRequestModel) async {
    return homeProfileRepository.getProfile(
      homeProfileRequestModel: homeProfileRequestModel,
    );
  }
}
