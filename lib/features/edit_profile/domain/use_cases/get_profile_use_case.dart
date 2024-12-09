import 'package:injectable/injectable.dart';
import 'package:karty/core/domain/usecase/base_usecase.dart';
import 'package:karty/core/network/base_handling.dart';
import 'package:karty/features/edit_profile/domain/repositories/get_profile_repository.dart';
import 'package:karty/features/home_profile/domain/entities/home_profile_entity.dart';

@injectable
class GetProfileUseCase implements UseCaseNoParam<HomeProfileEntity> {
  GetProfileUseCase({required this.getProfileRepository});
  final GetProfileRepository getProfileRepository;

  @override
  Future<CustomResponseType<HomeProfileEntity>> call() async {
    return getProfileRepository.getProfile();
  }
}
