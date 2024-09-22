// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactProfileResponseModel _$ContactProfileResponseModelFromJson(
        Map<String, dynamic> json) =>
    ContactProfileResponseModel(
      companyName: json['companyName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      position: json['position'] as String?,
      location: json['location'] as String?,
      isDefault: json['isDefault'] as bool?,
      qrData: json['qrData'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ContactProfileResponseModelToJson(
        ContactProfileResponseModel instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
      'phoneNumber': instance.phoneNumber,
      'position': instance.position,
      'location': instance.location,
      'isDefault': instance.isDefault,
      'qrData': instance.qrData,
      'email': instance.email,
    };
