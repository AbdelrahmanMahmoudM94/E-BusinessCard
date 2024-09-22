// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_details_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactDetailsModel _$ContactDetailsModelFromJson(Map<String, dynamic> json) =>
    ContactDetailsModel(
      company: json['company'] == null
          ? null
          : CompanyResponseModel.fromJson(
              json['company'] as Map<String, dynamic>),
      email: json['email'] as String?,
      name: json['name'] as String?,
      photo: json['photo'] as String?,
      profiles: (json['profiles'] as List<dynamic>?)
          ?.map((e) =>
              ContactProfileResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      socialMedia: (json['socialMedia'] as List<dynamic>?)
          ?.map((e) =>
              SocialMediaResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ContactDetailsModelToJson(
        ContactDetailsModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'photo': instance.photo,
      'profiles': instance.profiles,
      'company': instance.company,
      'socialMedia': instance.socialMedia,
    };

ContactDetailsResponseModel _$ContactDetailsResponseModelFromJson(
        Map<String, dynamic> json) =>
    ContactDetailsResponseModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : ContactDetailsModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$ContactDetailsResponseModelToJson(
        ContactDetailsResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };
