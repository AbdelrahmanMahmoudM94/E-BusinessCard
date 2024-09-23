// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_social_media_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditSocialMediaRequestModel _$EditSocialMediaRequestModelFromJson(
        Map<String, dynamic> json) =>
    EditSocialMediaRequestModel(
      url: json['url'] as String?,
      socialMediaName: json['socialMediaName'] as String?,
      socialMediaProfile: json['socialMediaProfile'] as String?,
    );

Map<String, dynamic> _$EditSocialMediaRequestModelToJson(
        EditSocialMediaRequestModel instance) =>
    <String, dynamic>{
      'socialMediaName': instance.socialMediaName,
      'socialMediaProfile': instance.socialMediaProfile,
      'url': instance.url,
    };
