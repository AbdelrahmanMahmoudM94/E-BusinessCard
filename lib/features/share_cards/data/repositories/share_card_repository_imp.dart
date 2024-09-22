import 'package:injectable/injectable.dart';
import 'package:karty/core/network/base_handling.dart';
import 'package:karty/features/share_cards/data/data_sources/share_card_data_sources.dart';
import 'package:karty/features/share_cards/data/models/request/contact_details_request.dart';
import 'package:karty/features/share_cards/data/models/request/share_card_request_model.dart';
import 'package:karty/features/share_cards/data/models/response/contact_details_response_model.dart';
import 'package:karty/features/share_cards/data/models/response/share_card_respone_model.dart';
 import 'package:karty/features/share_cards/domain/repositories/share_card_repository.dart';

@Injectable(as: ShareCardRepository)
class ShareCardRepositoryImp implements ShareCardRepository {
  ShareCardRepositoryImp({
    required this.shareCardRemoteDataSource,
  });
  final ShareCardRemoteDataSource shareCardRemoteDataSource;

  Future<CustomResponseType<ShareCardResponseModel>>
      getAllShareCardsList({required ShareCardsRequestModel shareCardsRequest}) async {
    return shareCardRemoteDataSource.getAllShareCardsList(
        shareCardsRequestModel: shareCardsRequest);
  }

  Future<CustomResponseType<ContactDetailsResponseModel>> getContactDetails({ 
   required ContactDetailsRequestModel contactRequestModel })async{
    return shareCardRemoteDataSource.getContactDetails(
        contactRequestModel: contactRequestModel);
   }
}
