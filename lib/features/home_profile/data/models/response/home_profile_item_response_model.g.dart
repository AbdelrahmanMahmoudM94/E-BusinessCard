// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_profile_item_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeProfileItemResponseModel _$HomeProfileItemResponseModelFromJson(
        Map<String, dynamic> json) =>
    HomeProfileItemResponseModel(
      companyName: json['companyName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      position: json['position'] as String?,
      location: json['location'] as String?,
      isDefault: json['isDefault'] as bool?,
      qrData: json['qrData'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$HomeProfileItemResponseModelToJson(
        HomeProfileItemResponseModel instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
      'phoneNumber': instance.phoneNumber,
      'position': instance.position,
      'location': instance.location,
      'isDefault': instance.isDefault,
      'qrData': instance.qrData,
      'email': instance.email,
    };

HomeProfileItemResponseResponseModel
    _$HomeProfileItemResponseResponseModelFromJson(Map<String, dynamic> json) =>
        HomeProfileItemResponseResponseModel(
          statusCode: (json['statusCode'] as num?)?.toInt(),
          data: json['data'] == null
              ? null
              : HomeProfileItemResponseModel.fromJson(
                  json['data'] as Map<String, dynamic>),
          message: json['message'] as String?,
          totalRecords: (json['totalRecords'] as num?)?.toInt(),
          hasMorePages: json['hasMorePages'] as bool?,
        );

Map<String, dynamic> _$HomeProfileItemResponseResponseModelToJson(
        HomeProfileItemResponseResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };
