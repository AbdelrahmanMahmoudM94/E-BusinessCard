import 'package:equatable/equatable.dart';

class HomeProfileEntity extends Equatable {
  const HomeProfileEntity({
    required this.email,
    this.lang,
    required this.name,
    required this.photo,
  });

  final String? lang;
  final String name;
  final String? email;
  final String? photo;

  @override
  List<Object?> get props => <Object?>[];
}
