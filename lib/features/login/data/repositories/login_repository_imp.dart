 import 'package:injectable/injectable.dart';
import 'package:karty/core/network/base_handling.dart';
import 'package:karty/features/login/data/data_sources/login_data_sources.dart';
import 'package:karty/features/login/data/models/response/app_config_response_model.dart';
import 'package:karty/features/login/domain/repositories/login_repository.dart';
 
@Injectable(as: LoginRepository)
class LoginRepositoryImp implements LoginRepository {
  LoginRepositoryImp({
    required this.loginRemoteDataSource,
  });
  final LoginRemoteDataSource loginRemoteDataSource;

 
  Future<CustomResponseType<AppConfigResponseModel>> getAppConfig(
      {required String email}) async {
    return loginRemoteDataSource.getAppConfig(email: email);
  }
  }
 
