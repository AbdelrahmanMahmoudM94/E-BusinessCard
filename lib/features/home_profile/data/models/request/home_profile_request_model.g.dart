// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_profile_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeProfileRequestModel _$HomeProfileRequestModelFromJson(
        Map<String, dynamic> json) =>
    HomeProfileRequestModel(
      lang: json['lang'] as String?,
      email: json['email'] as String? ?? '',
      name: json['name'] as String,
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$HomeProfileRequestModelToJson(
        HomeProfileRequestModel instance) =>
    <String, dynamic>{
      'lang': instance.lang,
      'name': instance.name,
      'email': instance.email,
      'photo': instance.photo,
    };
