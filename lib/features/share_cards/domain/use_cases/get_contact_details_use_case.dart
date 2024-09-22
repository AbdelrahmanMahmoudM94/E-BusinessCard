 import 'package:injectable/injectable.dart';
import 'package:karty/core/domain/usecase/base_usecase.dart';
import 'package:karty/features/share_cards/data/models/request/contact_details_request.dart';
import 'package:karty/features/share_cards/domain/entities/contact_details_entity.dart';
import 'package:karty/features/share_cards/domain/repositories/share_card_repository.dart';
import 'package:karty/features/shared/entity/base_entity.dart';
import 'package:karty/core/network/base_handling.dart';


@injectable
class GetContactDetailsUseCase implements UseCase<BaseEntity<ContactDetailsEntity>, ContactDetailsRequestModel> {
  GetContactDetailsUseCase({required this.shareCardRepository});
  final ShareCardRepository shareCardRepository;

  @override
  Future<CustomResponseType<BaseEntity<ContactDetailsEntity>>> call(
     ContactDetailsRequestModel  contactRequestModel ,
  ) async {
    return shareCardRepository.getContactDetails(
     contactRequestModel:contactRequestModel,
    );
  }
}
