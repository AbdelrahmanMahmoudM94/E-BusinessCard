import 'package:json_annotation/json_annotation.dart';

part 'home_profile_request_model.g.dart';

@JsonSerializable()
class HomeProfileRequestModel {
  HomeProfileRequestModel({required this.email, required this.lang});

  factory HomeProfileRequestModel.fromJson(Map<String, dynamic> json) =>
      _$HomeProfileRequestModelFromJson(json);
  final String? email;
  final String? lang;

  Map<String, dynamic> toJson() => _$HomeProfileRequestModelToJson(this);
}
