import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  const ProfileEntity({this.email, this.comments});
  final String? comments;
  final String? email;

  @override
  List<Object?> get props => <Object?>[];
}
