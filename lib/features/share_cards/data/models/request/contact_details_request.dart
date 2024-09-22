// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:karty/features/shared/entity/base_entity.dart';

part 'contact_details_request.g.dart';

@JsonSerializable()
class ContactDetailsRequestModel {
  ContactDetailsRequestModel({
    this.email,
    this.cardEmail,
    this.lang,
    this.cardProfileId
  });
 final String? email;
 final String? cardEmail;
 final String? lang;
 final int?cardProfileId;

  factory  ContactDetailsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ContactDetailsRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactDetailsRequestModelToJson(this);
}
