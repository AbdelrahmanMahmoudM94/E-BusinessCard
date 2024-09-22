import 'package:karty/core/network/base_handling.dart';
import 'package:karty/features/login/domain/entities/app_config_entity.dart';
import 'package:karty/features/shared/entity/base_entity.dart';
 
abstract class LoginRepository {

 
  Future<CustomResponseType<BaseEntity<List<AppConfigEntity>>>> getAppConfig({ 
  required String email });

  
}