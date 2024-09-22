 import 'package:injectable/injectable.dart';
import 'package:karty/core/domain/usecase/base_usecase.dart';
 import 'package:karty/features/share_cards/data/models/request/share_card_request_model.dart';
import 'package:karty/features/share_cards/domain/entities/shard_card_entity.dart';
import 'package:karty/features/share_cards/domain/repositories/share_card_repository.dart';
 import 'package:karty/features/shared/entity/base_entity.dart';
import 'package:karty/core/network/base_handling.dart';


@injectable
class GetAllShareCardsListUseCase implements UseCase<BaseEntity<List<ShareCardEntity>>, ShareCardsRequestModel> {
  GetAllShareCardsListUseCase({required this.shareCardRepository});
  final ShareCardRepository shareCardRepository;

  @override
  Future<CustomResponseType<BaseEntity<List<ShareCardEntity>>>> call(
     ShareCardsRequestModel shareCardsRequestModel,
  ) async {
    return shareCardRepository.getAllShareCardsList(
     shareCardsRequest:shareCardsRequestModel,
    );
  }
  
}
