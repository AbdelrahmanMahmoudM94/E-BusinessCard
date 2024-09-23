import 'package:equatable/equatable.dart';

class HomeProfileItemEntity extends Equatable {
  const HomeProfileItemEntity(
      {this.companyName,
      this.phoneNumber,
      this.position,
      this.location,
      this.isDefault,
      this.qrData});

  final String? companyName;
  final String? phoneNumber;
  final String? position;
  final String? location;
  final bool? isDefault;
  final String? qrData;

  @override
  List<Object?> get props => <Object?>[];
}
