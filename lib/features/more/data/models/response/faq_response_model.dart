import 'package:json_annotation/json_annotation.dart';
import 'package:karty/features/more/domain/entities/faq_entity.dart';
import 'package:karty/features/shared/entity/base_entity.dart';

part 'faq_response_model.g.dart';

@JsonSerializable()
class FaqModel extends FaqEntity {
    FaqModel({
    super.answer,
    super.question
  });
  factory  FaqModel.fromJson(Map<String, dynamic> json) =>
      _$FaqModelFromJson(json);

  Map<String, dynamic> toJson() => _$FaqModelToJson(this);
}

@JsonSerializable()
class FaqResponseModel extends BaseEntity<List<FaqModel>> {
  const  FaqResponseModel({
    super.statusCode,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });
  factory FaqResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FaqResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$FaqResponseModelToJson(this);
}

