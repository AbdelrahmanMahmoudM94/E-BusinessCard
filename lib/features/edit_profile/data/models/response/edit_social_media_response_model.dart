import 'package:json_annotation/json_annotation.dart';
import 'package:karty/features/edit_profile/domain/entities/social_media_edit_entity.dart';
import 'package:karty/features/shared/entity/base_entity.dart';

part 'edit_social_media_response_model.g.dart';

@JsonSerializable()
class EditSocialMediaModel extends EditSocialMediaEntity {
  EditSocialMediaModel(
      {super.socialMediaName, super.socialMediaProfile, super.url, super.icon});
  factory EditSocialMediaModel.fromJson(Map<String, dynamic> json) =>
      _$EditSocialMediaModelFromJson(json);

  Map<String, dynamic> toJson() => _$EditSocialMediaModelToJson(this);
}

@JsonSerializable()
class EditSocialMediaResponseModel extends BaseEntity<bool> {
  const EditSocialMediaResponseModel({
    super.statusCode,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });
  factory EditSocialMediaResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EditSocialMediaResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$EditSocialMediaResponseModelToJson(this);
}
