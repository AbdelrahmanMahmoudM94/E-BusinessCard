import 'package:json_annotation/json_annotation.dart';
import 'package:karty/features/edit_profile/domain/entities/profile_entity.dart';

part 'edit_profile_request_model.g.dart';

@JsonSerializable()
class EditProfileRequestModel extends ProfileEntity {
  EditProfileRequestModel({super.comments, super.email});

  factory EditProfileRequestModel.fromJson(Map<String, dynamic> json) =>
      _$EditProfileRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileRequestModelToJson(this);
}
