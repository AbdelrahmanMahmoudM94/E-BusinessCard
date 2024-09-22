 import 'package:injectable/injectable.dart';
import 'package:karty/core/domain/usecase/base_usecase.dart';
import 'package:karty/features/login/domain/entities/app_config_entity.dart';
import 'package:karty/features/login/domain/repositories/login_repository.dart';
import 'package:karty/features/shared/entity/base_entity.dart';
import 'package:karty/core/network/base_handling.dart';
 

@injectable
class GetAppConfigUseCase implements UseCase<BaseEntity<List<AppConfigEntity>>, String> {
  GetAppConfigUseCase({required this.loginRepository});
  final LoginRepository loginRepository;

  @override
  Future<CustomResponseType<BaseEntity<List<AppConfigEntity>>>> call(
     String  email,
  ) async {
    return loginRepository.getAppConfig(
     email:email,
    );
  }
}
