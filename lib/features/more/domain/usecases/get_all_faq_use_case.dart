import 'package:injectable/injectable.dart';
import 'package:karty/core/domain/usecase/base_usecase.dart';
import 'package:karty/core/network/base_handling.dart';
import 'package:karty/features/more/domain/entities/faq_entity.dart';
import 'package:karty/features/more/domain/repositories/more_repository.dart';
import 'package:karty/features/shared/entity/base_entity.dart';

@injectable
class GetAllFaqListUseCase implements UseCase<BaseEntity<List<FaqEntity>>,String> {
  GetAllFaqListUseCase({required this.moreRepository});
  final MoreRepository moreRepository;

  @override
  Future<CustomResponseType<BaseEntity<List<FaqEntity>>>> call(String lang) async {
    return moreRepository.getAllFaq(
      lang: lang
    );
  }
}
