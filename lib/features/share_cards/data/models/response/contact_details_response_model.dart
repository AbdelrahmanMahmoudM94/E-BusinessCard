import 'package:json_annotation/json_annotation.dart';
import 'package:karty/features/share_cards/data/models/response/company_response_model.dart';
import 'package:karty/features/share_cards/data/models/response/contact_profile_response_model.dart';
import 'package:karty/features/share_cards/data/models/response/social_media_response_model.dart';
import 'package:karty/features/share_cards/domain/entities/contact_details_entity.dart';
import 'package:karty/features/shared/entity/base_entity.dart';

part 'contact_details_response_model.g.dart';

@JsonSerializable()
class ContactDetailsModel extends ContactDetailsEntity {
    ContactDetailsModel({
    super.company,
    super.email,
    super.name,
    super.photo,
    super.profiles,
    super.socialMedia
  });
  factory  ContactDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ContactDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactDetailsModelToJson(this);
}

@JsonSerializable()
class ContactDetailsResponseModel extends BaseEntity<ContactDetailsModel> {
  const  ContactDetailsResponseModel({
    super.statusCode,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });
  factory ContactDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ContactDetailsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactDetailsResponseModelToJson(this);
}
