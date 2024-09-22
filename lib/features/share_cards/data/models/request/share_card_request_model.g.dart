// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_card_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShareCardsRequestModel _$ShareCardsRequestModelFromJson(
        Map<String, dynamic> json) =>
    ShareCardsRequestModel(
      email: json['email'] as String?,
      searchText: json['searchText'] as String?,
      lang: json['lang'] as String?,
      PageNumber: (json['PageNumber'] as num?)?.toInt(),
      PageSize: (json['PageSize'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ShareCardsRequestModelToJson(
        ShareCardsRequestModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'searchText': instance.searchText,
      'lang': instance.lang,
      'PageNumber': instance.PageNumber,
      'PageSize': instance.PageSize,
    };
