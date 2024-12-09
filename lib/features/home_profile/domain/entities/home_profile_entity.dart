import 'package:equatable/equatable.dart';
import 'package:karty/features/home_profile/data/models/response/home_profile_item_response_model.dart';
import 'package:karty/features/share_cards/data/models/response/company_response_model.dart';
import 'package:karty/features/share_cards/data/models/response/social_media_response_model.dart';

class HomeProfileEntity extends Equatable {
  const HomeProfileEntity({
    required this.email,
    this.lang,
    required this.name,
    required this.photo,
    required this.company,
    required this.profiles,
    required this.socialMedia,
  });

  final String? lang;
  final String? name;
  final String? email;
  final String? photo;
  final List<SocialMediaResponseModel>? socialMedia;
  final CompanyResponseModel? company;
  final List<HomeProfileItemResponseModel>? profiles;

  @override
  List<Object?> get props => <Object?>[];
}
