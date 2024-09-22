import 'package:json_annotation/json_annotation.dart';
import 'package:karty/features/share_cards/domain/entities/social_media_entity.dart';
import 'package:karty/features/shared/entity/base_entity.dart';

part 'social_media_response_model.g.dart';

@JsonSerializable()
class SocialMediaResponseModel extends SocialMediaEntity {
    SocialMediaResponseModel({
     super.socialMediaName,
    super.icon,
    super.socialMediaProfile,
    super.url,
  });
  factory  SocialMediaResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SocialMediaResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SocialMediaResponseModelToJson(this);
}
