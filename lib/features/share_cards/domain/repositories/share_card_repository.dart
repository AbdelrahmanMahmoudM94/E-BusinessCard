import 'package:karty/core/network/base_handling.dart';
import 'package:karty/features/share_cards/data/models/request/contact_details_request.dart';
import 'package:karty/features/share_cards/data/models/request/share_card_request_model.dart';
import 'package:karty/features/share_cards/domain/entities/contact_details_entity.dart';
 import 'package:karty/features/share_cards/domain/entities/shard_card_entity.dart';
import 'package:karty/features/shared/entity/base_entity.dart';

abstract class ShareCardRepository {
  Future<CustomResponseType<BaseEntity<List<ShareCardEntity>>>>
      getAllShareCardsList({required ShareCardsRequestModel shareCardsRequest});

      Future<CustomResponseType<BaseEntity<ContactDetailsEntity>>> getContactDetails({ 
       required ContactDetailsRequestModel contactRequestModel });
}

