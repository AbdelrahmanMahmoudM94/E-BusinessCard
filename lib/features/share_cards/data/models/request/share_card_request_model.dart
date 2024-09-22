import 'package:json_annotation/json_annotation.dart';

part 'share_card_request_model.g.dart';

@JsonSerializable()
class ShareCardsRequestModel {
  factory ShareCardsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ShareCardsRequestModelFromJson(json);
  const ShareCardsRequestModel({
    this.email,
    this.searchText,
    this.lang,
    this.PageNumber,
    this.PageSize,
  });

  final String? email;
  final String? searchText;
  final String? lang;
  final int? PageNumber;
  final int? PageSize;

  Map<String, dynamic> toJson() => _$ShareCardsRequestModelToJson(this);
}
