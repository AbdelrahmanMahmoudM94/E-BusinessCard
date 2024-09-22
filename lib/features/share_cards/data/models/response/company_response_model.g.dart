// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyResponseModel _$CompanyResponseModelFromJson(
        Map<String, dynamic> json) =>
    CompanyResponseModel(
      companyId: json['companyId'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CompanyResponseModelToJson(
        CompanyResponseModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'companyId': instance.companyId,
    };
