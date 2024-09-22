import 'package:json_annotation/json_annotation.dart';
import 'package:karty/features/share_cards/domain/entities/shard_card_entity.dart';
import 'package:karty/features/shared/entity/base_entity.dart';

part 'share_card_respone_model.g.dart';

@JsonSerializable()
class ShareCardModel extends ShareCardEntity {
    ShareCardModel({
     super.profileId,
    super.companyName,
    super.name,
    super.socialMedia,
    super.photo,
    super.keyCard,
    super.phoneNumber,
    super.position,
    super.location,
    super.isDefault,
    super.qrData,
    super.email,
  });
  factory  ShareCardModel.fromJson(Map<String, dynamic> json) =>
      _$ShareCardModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShareCardModelToJson(this);
}

@JsonSerializable()
class ShareCardResponseModel extends BaseEntity<List<ShareCardModel>> {
  const  ShareCardResponseModel({
    super.statusCode,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });
  factory ShareCardResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ShareCardResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShareCardResponseModelToJson(this);
}
