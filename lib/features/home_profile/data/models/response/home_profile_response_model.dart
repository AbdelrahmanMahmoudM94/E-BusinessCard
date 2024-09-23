import 'package:json_annotation/json_annotation.dart';
import 'package:karty/features/edit_profile/data/models/response/edit_social_media_response_model.dart';
import 'package:karty/features/home_profile/domain/entities/home_profile_entity.dart';
import 'package:karty/features/share_cards/data/models/response/company_response_model.dart';
import 'package:karty/features/shared/entity/base_entity.dart';

part 'home_profile_response_model.g.dart';

@JsonSerializable()
class HomeProfileModel extends HomeProfileEntity {
  HomeProfileModel(
      {super.email,
      super.lang,
      required super.name,
      super.photo,
      //   required this.profiles,
      required this.company,
      required this.socialMediaList});

  factory HomeProfileModel.fromJson(Map<String, dynamic> json) =>
      _$HomeProfileModelFromJson(json);

  final List<EditSocialMediaResponseModel> socialMediaList;
  final CompanyResponseModel company;
  //final List<homeProfileItemResponseModel> profiles;

  Map<String, dynamic> toJson() => _$HomeProfileModelToJson(this);
}

@JsonSerializable()
class HomeProfileResponseModel extends BaseEntity<HomeProfileModel> {
  const HomeProfileResponseModel({
    super.statusCode,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });
  factory HomeProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HomeProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeProfileResponseModelToJson(this);
}
