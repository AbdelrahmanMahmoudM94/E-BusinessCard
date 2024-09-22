// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ContactProfileEntity extends Equatable {
  const ContactProfileEntity({
    this.companyName,
    this.phoneNumber,
    this.position,
    this.location,
    this.isDefault,
    this.qrData,
    this.email,
  });

  final String? companyName;
  final String? phoneNumber;
  final String? position;
  final String? location;
  final bool? isDefault;
  final String? qrData;
  final String? email;
  @override
  List<Object?> get props => <Object?>[];
}
