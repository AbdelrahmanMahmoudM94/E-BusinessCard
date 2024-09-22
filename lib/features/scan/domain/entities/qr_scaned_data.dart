// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class QrScannedDataEntity extends Equatable {
  const QrScannedDataEntity({
    required this.title,
    required this.fn,
    required this.org,
    required this.address,
    required this.tel,
    required this.email,
  });

 final String?fn;
final String title;
final String org;
final String address;
final String tel;
final String email;


  @override
  List<Object?> get props => <Object?>[];
}


 