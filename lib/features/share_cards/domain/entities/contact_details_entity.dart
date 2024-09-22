// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:karty/features/share_cards/data/models/response/company_response_model.dart';
import 'package:karty/features/share_cards/data/models/response/contact_profile_response_model.dart';
import 'package:karty/features/share_cards/data/models/response/social_media_response_model.dart';

class ContactDetailsEntity extends Equatable {
  const ContactDetailsEntity({
    this.name,
    this.email,
    this.photo,
    this.profiles,
    this.company,
    this.socialMedia,
  });

  final String? name;
  final String? email;
  final String? photo;
  final List<ContactProfileResponseModel>? profiles;
  final CompanyResponseModel? company;
  final List<SocialMediaResponseModel>? socialMedia;

  @override
  List<Object?> get props => <Object?>[];
}
