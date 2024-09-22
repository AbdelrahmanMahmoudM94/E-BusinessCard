// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_details_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactDetailsRequestModel _$ContactDetailsRequestModelFromJson(
        Map<String, dynamic> json) =>
    ContactDetailsRequestModel(
      email: json['email'] as String?,
      cardEmail: json['cardEmail'] as String?,
      lang: json['lang'] as String?,
      cardProfileId: (json['cardProfileId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ContactDetailsRequestModelToJson(
        ContactDetailsRequestModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'cardEmail': instance.cardEmail,
      'lang': instance.lang,
      'cardProfileId': instance.cardProfileId,
    };
