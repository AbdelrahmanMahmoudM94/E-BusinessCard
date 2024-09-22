import 'package:json_annotation/json_annotation.dart';
import 'package:karty/features/share_cards/domain/entities/company_entity.dart';
import 'package:karty/features/shared/entity/base_entity.dart';

part 'company_response_model.g.dart';

@JsonSerializable()
class CompanyResponseModel extends CompanyEntity {
    CompanyResponseModel({
    super.companyId,
    super.name
  });
  factory  CompanyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyResponseModelToJson(this);
}
