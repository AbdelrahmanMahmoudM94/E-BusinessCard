// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class SocialMediaEntity extends Equatable {
  const SocialMediaEntity({
    this.socialMediaName,
    this.icon,
    this.socialMediaProfile,
    this.url,
  });

  final String? socialMediaName;
  final String? icon;
  final String? socialMediaProfile;
  final String? url;

  @override
  List<Object?> get props => <Object?>[];
}
