import 'package:equatable/equatable.dart';

class CompanyEntity extends Equatable {
const  CompanyEntity({this.companyId, this.name});
  final String? name;
  final String? companyId;

  @override
  List<Object?> get props => <Object?>[];
}
