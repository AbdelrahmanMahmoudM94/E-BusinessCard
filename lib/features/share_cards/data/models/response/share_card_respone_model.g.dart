// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_card_respone_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShareCardModel _$ShareCardModelFromJson(Map<String, dynamic> json) =>
    ShareCardModel(
      profileId: (json['profileId'] as num?)?.toInt(),
      companyName: json['companyName'] as String?,
      name: json['name'] as String?,
      socialMedia: json['socialMedia'] as String?,
      photo: json['photo'] as String?,
      keyCard: json['keyCard'] as bool?,
      phoneNumber: json['phoneNumber'] as String?,
      position: json['position'] as String?,
      location: json['location'] as String?,
      isDefault: json['isDefault'] as bool?,
      qrData: json['qrData'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ShareCardModelToJson(ShareCardModel instance) =>
    <String, dynamic>{
      'profileId': instance.profileId,
      'companyName': instance.companyName,
      'name': instance.name,
      'socialMedia': instance.socialMedia,
      'photo': instance.photo,
      'keyCard': instance.keyCard,
      'phoneNumber': instance.phoneNumber,
      'position': instance.position,
      'location': instance.location,
      'isDefault': instance.isDefault,
      'qrData': instance.qrData,
      'email': instance.email,
    };

ShareCardResponseModel _$ShareCardResponseModelFromJson(
        Map<String, dynamic> json) =>
    ShareCardResponseModel(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ShareCardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      hasMorePages: json['hasMorePages'] as bool?,
    );

Map<String, dynamic> _$ShareCardResponseModelToJson(
        ShareCardResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
      'totalRecords': instance.totalRecords,
      'hasMorePages': instance.hasMorePages,
    };
