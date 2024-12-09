import 'package:json_annotation/json_annotation.dart';
import 'package:karty/features/edit_profile/domain/entities/social_media_edit_entity.dart';

part 'edit_social_media_request_model.g.dart';

@JsonSerializable()
class EditSocialMediaRequestModel extends EditSocialMediaEntity {
  EditSocialMediaRequestModel(
      {super.url, super.socialMediaName, super.socialMediaProfile});
  factory EditSocialMediaRequestModel.fromJson(Map<String, dynamic> json) =>
      _$EditSocialMediaRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$EditSocialMediaRequestModelToJson(this);
}
