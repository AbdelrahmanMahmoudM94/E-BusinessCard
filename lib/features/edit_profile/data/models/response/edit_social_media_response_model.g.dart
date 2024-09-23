// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_social_media_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditSocialMediaModel _$EditSocialMediaModelFromJson(
        Map<String, dynamic> json) =>
    EditSocialMediaModel(
      socialMediaName: json['socialMediaName'] as String?,
      socialMediaProfile: json['socialMediaProfile'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$EditSocialMediaModelToJson(
        EditSocialMediaModel instance) =>
    <String, dynamic>{
      'socialMediaName': instance.socialMediaName,
      'socialMediaProfile': instance.socialMediaProfile,
      'url': instance.url,
    };

EditSocialMediaResponseModel _$EditSocialMediaResponseModelFromJson(
        Map<String, dynamic> json) =>
    EditSocialMediaResponseModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      data: json['data'] as bool?,
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$EditSocialMediaResponseModelToJson(
        EditSocialMediaResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };
