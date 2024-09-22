import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:karty/core/network/api/network_apis_constants.dart';
import 'package:karty/core/network/network_helper.dart';
import 'package:karty/core/network/base_handling.dart';
import 'package:karty/error/failure.dart';
import 'package:karty/features/share_cards/data/models/request/contact_details_request.dart';
import 'package:karty/features/share_cards/data/models/request/share_card_request_model.dart';
import 'package:karty/features/share_cards/data/models/response/contact_details_response_model.dart';
import 'package:karty/features/share_cards/data/models/response/share_card_respone_model.dart';

abstract class ShareCardRemoteDataSource {
  Future<CustomResponseType<ShareCardResponseModel>> getAllShareCardsList(
      {required ShareCardsRequestModel shareCardsRequestModel});
  Future<CustomResponseType<ContactDetailsResponseModel>> getContactDetails(
      {required ContactDetailsRequestModel contactRequestModel});
}

@Injectable(as: ShareCardRemoteDataSource)
class MoreRemoteDataSourceImpl implements ShareCardRemoteDataSource {
  MoreRemoteDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<ShareCardResponseModel>> getAllShareCardsList(
      {required ShareCardsRequestModel shareCardsRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper.post(
        path: ApiConstants.getShareCardsList,
        data: shareCardsRequestModel.toJson());

    if (result.success) {
      return right(ShareCardResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<ContactDetailsResponseModel>> getContactDetails(
      {required ContactDetailsRequestModel contactRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper.post(
        path: ApiConstants.getContactDetails,
        data: contactRequestModel.toJson());

    if (result.success) {
      return right(ContactDetailsResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
