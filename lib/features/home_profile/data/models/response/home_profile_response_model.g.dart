// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeProfileModel _$HomeProfileModelFromJson(Map<String, dynamic> json) =>
    HomeProfileModel(
      email: json['email'] as String?,
      lang: json['lang'] as String?,
      name: json['name'] as String?,
      photo: json['photo'] as String?,
      company: json['company'] == null
          ? null
          : CompanyResponseModel.fromJson(
              json['company'] as Map<String, dynamic>),
      profiles: (json['profiles'] as List<dynamic>?)
          ?.map((e) =>
              HomeProfileItemResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      socialMedia: (json['socialMedia'] as List<dynamic>?)
          ?.map((e) =>
              SocialMediaResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeProfileModelToJson(HomeProfileModel instance) =>
    <String, dynamic>{
      'lang': instance.lang,
      'name': instance.name,
      'email': instance.email,
      'photo': instance.photo,
      'socialMedia': instance.socialMedia,
      'company': instance.company,
      'profiles': instance.profiles,
    };

HomeProfileResponseModel _$HomeProfileResponseModelFromJson(
        Map<String, dynamic> json) =>
    HomeProfileResponseModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : HomeProfileModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$HomeProfileResponseModelToJson(
        HomeProfileResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };
