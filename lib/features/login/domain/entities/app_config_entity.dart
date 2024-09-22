import 'package:equatable/equatable.dart';

class AppConfigEntity extends Equatable {
  const AppConfigEntity({
    this.key,
    this.value,
  });

  final String? key;
  final String? value;

  @override
  List<Object?> get props => <Object?>[];
}
