// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ShareCardEntity extends Equatable {
  const ShareCardEntity({
    this.profileId,
    this.companyName,
    this.name,
    this.socialMedia,
    this.photo,
    this.keyCard,
    this.phoneNumber,
    this.position,
    this.location,
    this.isDefault,
    this.qrData,
    this.email,
  });

  final int? profileId;
  final String? companyName;
  final String? name;
  final String? socialMedia;
  final String? photo;
  final bool? keyCard;
  final String? phoneNumber;
  final String? position;
  final String? location;
  final bool? isDefault;
  final String? qrData;
  final String? email;

  @override
  List<Object?> get props => <Object?>[];
}
