import 'package:json_annotation/json_annotation.dart';
import 'package:karty/features/login/domain/entities/app_config_entity.dart';
import 'package:karty/features/shared/entity/base_entity.dart';
 
part 'app_config_response_model.g.dart';

@JsonSerializable()
class AppConfigModel extends AppConfigEntity {
    AppConfigModel({
    super.key,
    super.value
  });
  factory  AppConfigModel.fromJson(Map<String, dynamic> json) =>
      _$AppConfigModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppConfigModelToJson(this);
}

@JsonSerializable()
class AppConfigResponseModel extends BaseEntity<List<AppConfigModel>> {
  const  AppConfigResponseModel({
    super.statusCode,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });
  factory AppConfigResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AppConfigResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppConfigResponseModelToJson(this);
}
