import 'package:injectable/injectable.dart';
import 'package:karty/core/network/network_helper.dart';

abstract class SplashRemoteDataSource {}

@Injectable(as: SplashRemoteDataSource)
class SplashRemoteDataSourceImpl implements SplashRemoteDataSource {
  SplashRemoteDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;
}
