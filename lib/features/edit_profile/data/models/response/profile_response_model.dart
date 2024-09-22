import 'package:json_annotation/json_annotation.dart';
import 'package:karty/features/edit_profile/domain/entities/profile_entity.dart';
import 'package:karty/features/shared/entity/base_entity.dart';

part 'profile_response_model.g.dart';

@JsonSerializable()
class ProfileModel extends ProfileEntity {
  ProfileModel({super.email, super.comments});

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}

@JsonSerializable()
class ProfileResponseModel extends BaseEntity<ProfileModel> {
  const ProfileResponseModel({
    super.statusCode,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });
  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseModelToJson(this);
}
