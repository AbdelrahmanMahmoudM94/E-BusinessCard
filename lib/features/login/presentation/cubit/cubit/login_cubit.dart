import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:karty/core/network/base_handling.dart';
import 'package:karty/error/failure.dart';
import 'package:karty/features/login/domain/entities/app_config_entity.dart';
import 'package:karty/features/login/domain/use_cases/get_app_config_use_case.dart';
import 'package:karty/features/shared/data/local_data.dart';
 import 'package:karty/features/shared/entity/base_entity.dart';
  
part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.getAppConfigUseCase} ) : super(LoginInitial());

    final GetAppConfigUseCase getAppConfigUseCase;
   Future<void> getAppConfig({required String email}) async {
    final CustomResponseType<BaseEntity<List<AppConfigEntity>>>
        eitherPackagesOrFailure = await getAppConfigUseCase(email);

    eitherPackagesOrFailure.fold(
        (Failure failure) {}, (BaseEntity<List<AppConfigEntity>> response)async {
          
          await LocalData.setAppAndroidVersion(response.data!.firstWhere((AppConfigEntity appConfig)=>appConfig.key=="AndroidAppVersion").value!);
          await LocalData.setAppIosVersion(response.data!.firstWhere((AppConfigEntity appConfig)=>appConfig.key=="IOSAppVersion").value!);
          
        });
 
}
}

