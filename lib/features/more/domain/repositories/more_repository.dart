import 'package:karty/core/network/base_handling.dart';
 import 'package:karty/features/more/domain/entities/faq_entity.dart';
 import 'package:karty/features/shared/entity/base_entity.dart';

abstract class MoreRepository {
  Future<CustomResponseType<BaseEntity<List<FaqEntity>>>> getAllFaq(
      {required String lang});

 
}
