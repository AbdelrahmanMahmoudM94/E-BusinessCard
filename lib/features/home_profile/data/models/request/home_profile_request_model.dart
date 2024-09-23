import 'package:json_annotation/json_annotation.dart';
import 'package:karty/features/home_profile/domain/entities/home_profile_entity.dart';

part 'home_profile_request_model.g.dart';

@JsonSerializable()
class HomeProfileRequestModel extends HomeProfileEntity {
  HomeProfileRequestModel({
    super.lang,
    super.email = '',
    super.name = '',
    super.photo = '',
  });

  factory HomeProfileRequestModel.fromJson(Map<String, dynamic> json) =>
      _$HomeProfileRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeProfileRequestModelToJson(this);
}
