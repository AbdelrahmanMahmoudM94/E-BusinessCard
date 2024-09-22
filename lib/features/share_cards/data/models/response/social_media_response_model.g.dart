// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_media_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialMediaResponseModel _$SocialMediaResponseModelFromJson(
        Map<String, dynamic> json) =>
    SocialMediaResponseModel(
      socialMediaName: json['socialMediaName'] as String?,
      icon: json['icon'] as String?,
      socialMediaProfile: json['socialMediaProfile'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$SocialMediaResponseModelToJson(
        SocialMediaResponseModel instance) =>
    <String, dynamic>{
      'socialMediaName': instance.socialMediaName,
      'icon': instance.icon,
      'socialMediaProfile': instance.socialMediaProfile,
      'url': instance.url,
    };
