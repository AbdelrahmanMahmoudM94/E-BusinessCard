// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileRequestModel _$EditProfileRequestModelFromJson(
        Map<String, dynamic> json) =>
    EditProfileRequestModel(
      comments: json['comments'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$EditProfileRequestModelToJson(
        EditProfileRequestModel instance) =>
    <String, dynamic>{
      'comments': instance.comments,
      'email': instance.email,
    };
