import 'package:injectable/injectable.dart';
import 'package:karty/core/network/base_handling.dart';
import 'package:karty/features/more/data/data_sources/remote/more_data_sources.dart';
 import 'package:karty/features/more/data/models/response/faq_response_model.dart';
 
import 'package:karty/features/more/domain/repositories/more_repository.dart';

@Injectable(as: MoreRepository)
class MoreRepositoryImp implements MoreRepository {
  MoreRepositoryImp({
    required this.moreRemoteDataSource,
  });
  final MoreRemoteDataSource moreRemoteDataSource;

  @override
  Future<CustomResponseType<FaqResponseModel>> getAllFaq(
      {required String lang}) async {
    return moreRemoteDataSource.getAllFaq(lang: lang);
  }

 
}
