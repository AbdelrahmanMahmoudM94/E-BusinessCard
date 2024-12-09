import 'package:json_annotation/json_annotation.dart';
import 'package:karty/features/share_cards/domain/entities/contact_profile_entity.dart';
import 'package:karty/features/shared/entity/base_entity.dart';

part 'home_profile_item_response_model.g.dart';

@JsonSerializable()
class HomeProfileItemResponseModel extends ContactProfileEntity {
  HomeProfileItemResponseModel({
    super.companyName,
    super.phoneNumber,
    super.position,
    super.location,
    super.isDefault,
    super.qrData,
    super.email,
  });
  factory HomeProfileItemResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HomeProfileItemResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeProfileItemResponseModelToJson(this);
}

@JsonSerializable()
class HomeProfileItemResponseResponseModel
    extends BaseEntity<HomeProfileItemResponseModel> {
  const HomeProfileItemResponseResponseModel({
    super.statusCode,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });
  factory HomeProfileItemResponseResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$HomeProfileItemResponseResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$HomeProfileItemResponseResponseModelToJson(this);
}
