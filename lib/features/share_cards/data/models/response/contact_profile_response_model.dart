import 'package:json_annotation/json_annotation.dart';
import 'package:karty/features/share_cards/domain/entities/contact_profile_entity.dart';
import 'package:karty/features/shared/entity/base_entity.dart';

part 'contact_profile_response_model.g.dart';

@JsonSerializable()
class ContactProfileResponseModel extends ContactProfileEntity {
    ContactProfileResponseModel({
     super.companyName,
    super.phoneNumber,
    super.position,
    super.location,
    super.isDefault,
    super.qrData,
    super.email,
  });
  factory  ContactProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ContactProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactProfileResponseModelToJson(this);
}
