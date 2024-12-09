import 'package:json_annotation/json_annotation.dart';
import 'package:karty/features/edit_profile/domain/entities/edit_profile_entity.dart';
import 'package:karty/features/shared/entity/base_entity.dart';

part 'edit_profile_response_model.g.dart';

@JsonSerializable()
class EditProfileModel extends ProfileEntity {
  EditProfileModel({super.email, super.comments});

  factory EditProfileModel.fromJson(Map<String, dynamic> json) =>
      _$EditProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileModelToJson(this);
}

@JsonSerializable()
class EditProfileResponseModel extends BaseEntity<bool> {
  const EditProfileResponseModel({
    super.statusCode,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });
  factory EditProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EditProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileResponseModelToJson(this);
}
