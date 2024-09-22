import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:karty/core/network/base_handling.dart';
import 'package:karty/features/shared/entity/base_entity.dart';
import 'package:karty/features/splash/data/data_sources/splash_data_sources.dart';
 import 'package:karty/features/splash/domain/repositories/splash_repository.dart';

@Injectable(as: SplashRepository)
class SplashRepositoryImp implements SplashRepository {
  SplashRepositoryImp({
    required this.splashRemoteDataSource,
  });
  final SplashRemoteDataSource splashRemoteDataSource;
 
}
