// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileModel _$EditProfileModelFromJson(Map<String, dynamic> json) =>
    EditProfileModel(
      email: json['email'] as String?,
      comments: json['comments'] as String?,
    );

Map<String, dynamic> _$EditProfileModelToJson(EditProfileModel instance) =>
    <String, dynamic>{
      'comments': instance.comments,
      'email': instance.email,
    };

EditProfileResponseModel _$EditProfileResponseModelFromJson(
        Map<String, dynamic> json) =>
    EditProfileResponseModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      data: json['data'] as bool?,
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$EditProfileResponseModelToJson(
        EditProfileResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };
